///
/// model/airtable_data_profil.dart
///

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_app/utils/config.dart';

class AirtableDataProfil {
  String id;
  String createdTime;
  String content;
  String icon;

  AirtableDataProfil({
    required this.id,
    required this.createdTime,
    required this.content,
    required this.icon,
  });
}

class AirtableData {
  final Uri urlProfil = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/profil",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataProfil>> getProfil() async {
    final res = await http.get(
      urlProfil,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataProfil> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataProfil(
              id: value['id'],
              createdTime: value['createdTime'],
              content: value['fields']['content'],
              icon: value['fields']['icon'],
            ),
          )
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
