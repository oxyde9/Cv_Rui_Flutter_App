///
/// screen/infos.dart
///quicktype.io

import 'package:flutter/material.dart';
import 'package:cv_app/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_app/model/airtable_data_competence.dart';

class SkillScreen extends StatelessWidget {
  @override
  final AirtableData airtableData = AirtableData();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Compétences"), actions: <Widget>[
          icoLink(
            FontAwesomeIcons.instagram,
            "https://www.instagram.com/rui.fs/",
          ),
          icoLink(
            FontAwesomeIcons.linkedin,
            "https://www.linkedin.com/in/rui-santos-29889a184/",
          ),
          icoLink(
            FontAwesomeIcons.blog,
            "http://www.ruisantos.fr/",
          ),
        ]),
        body: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
              future: airtableData.getSkills(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataSkills>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataSkills>? values = snapshot.data;
                  return ListView(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: values!
                        .map((AirtableDataSkills value) => Container(
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            value.domaine,
                                            style: headerTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Wrap(children: [
                                            for (var skill in value.skills)
                                              Image.network(skill, width: 80.0)
                                          ]),
                                          SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }

  /// flutter pub add font_awesome_flutter
  Widget icoLink(var _ico, String _url) {
    return GestureDetector(
      onTap: () {
        launch(_url, forceSafariVC: false);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        // Change button text when light changes state.
        child: FaIcon(
          _ico,
          color: Colors.white60,
          size: 32.0,
        ),
      ),
    );
  }
}
