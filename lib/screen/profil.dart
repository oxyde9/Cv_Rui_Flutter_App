///
/// screen/home.dart
///
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_app/theme.dart';

import 'package:cv_app/model/airtable_data_profil.dart';

class ProfilScreen extends StatelessWidget {
  @override
  final AirtableData airtableData = AirtableData();
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(2, 0, 62, 1),
                image: DecorationImage(
                    image: AssetImage('assets/bas.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/back.png'),
                      scale: 3,
                      alignment: Alignment.topLeft),
                ),
                width: double.infinity,
                height: 450.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/rui.jpg'),
                        maxRadius: 90.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Rui SANTOS",
                        style: heading,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    icoLink(
                                      FontAwesomeIcons.instagram,
                                      "https://www.instagram.com/rui.fs/",
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    icoLink(
                                      FontAwesomeIcons.linkedin,
                                      "https://www.linkedin.com/in/rui-santos-29889a184/",
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    icoLink(
                                      FontAwesomeIcons.blog,
                                      "http://www.ruisantos.fr/",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: FutureBuilder(
              future: airtableData.getProfil(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<AirtableDataProfil>> snapshot) {
                if (snapshot.hasData) {
                  List<AirtableDataProfil>? values = snapshot.data;
                  return ListView(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: values!
                        .map(
                          (AirtableDataProfil value) => ListTile(
                            leading: Text(
                              value.icon,
                              style: const TextStyle(
                                  fontFamily: 'MaterialIcons', fontSize: 24),
                            ),
                            title: Text(value.content),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// flutter pub add font_awesome_flutter
Widget icoLink(var _ico, String _url) {
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: false);
    },
    child: Container(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueAccent,
        ),
        padding: const EdgeInsets.all(8),
        // Change button text when light changes state.
        child: FaIcon(
          _ico,
          color: Colors.black,
          size: 32.0,
        ),
      ),
    ),
  );
}
