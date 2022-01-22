import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_app/utils/config.dart';

class AirtableDataEducation {
  String id;
  String createdTime;
  String titre;
  String formation;
  String date;
  String detail;
  String logo;

  AirtableDataEducation({
    required this.id,
    required this.createdTime,
    required this.titre,
    required this.formation,
    required this.date,
    required this.detail,
    required this.logo,
  });
}

class AirtableData {
  final Uri urlEducation = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/education",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataEducation>> getEducation() async {
    final res = await http.get(
      urlEducation,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataEducation> values = [];
      data.forEach(
        (value) => {
          values.add(
            AirtableDataEducation(
              id: value['id'],
              createdTime: value['createdTime'],
              titre: value['fields']['titre'],
              formation: value['fields']['formation'],
              date: value['fields']['date'],
              detail: value['fields']['detail'],
              logo: value['fields']['logo'][0]['url'],
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
