///
/// screen/infos.dart
///quicktype.io

import 'package:cv_app/widget/imageStack.dart';
import 'package:flutter/material.dart';
import 'package:cv_app/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_app/model/airtable_data_infos.dart';

class InfoScreen extends StatelessWidget {
  @override
  final AirtableData airtableData = AirtableData();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Infos"), actions: <Widget>[
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
              future: airtableData.getInfo(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataInfo>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataInfo>? values = snapshot.data;
                  return ListView(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: values!
                        .map((AirtableDataInfo value) => Container(
                            child: imageStack(
                                value.image, value.text, value.titre)))
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
