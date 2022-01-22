///
/// screen/infos.dart
///quicktype.io

import 'package:flutter/material.dart';
import 'package:cv_app/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_app/model/airtable_data_education.dart';

class EducationScreen extends StatelessWidget {
  @override
  final AirtableData airtableData = AirtableData();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Education"), actions: <Widget>[
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
              future: airtableData.getEducation(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataEducation>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataEducation>? values = snapshot.data;
                  return ListView(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: values!
                        .map((AirtableDataEducation value) => Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: cardBGColor,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 90,
                                    height: 90,
                                    child: Image.network(value.logo),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          value.titre,
                                          style: headerTextStyle,
                                        ),
                                        Text(
                                          value.formation,
                                          style: subHeaderTextStyle,
                                        ),
                                        Text(
                                          value.date,
                                          style: subHeaderTextStyle,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          value.detail,
                                          style: bodyTextStyle,
                                        ),
                                      ],
                                    ),
                                  ))
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
