import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cv_app/utils/config.dart';

class AirtableDataSkills {
  String id;
  String createdTime;
  String domaine;
  List<String> skills;

  AirtableDataSkills({
    required this.id,
    required this.createdTime,
    required this.domaine,
    required this.skills,
  });
}

class AirtableData {
  final Uri urlSkills = Uri.https(
    "api.airtable.com",
    "/v0/${Config.airtableProjectBase}/competences",
    {"maxRecords": "10", "view": "Grid view"},
  );

  Future<List<AirtableDataSkills>> getSkills() async {
    final res = await http.get(
      urlSkills,
      headers: {"Authorization": "Bearer ${Config.airtableApiKey}"},
    );

    print(res.body);

    if (res.statusCode == 200) {
      var convertDataToJson = jsonDecode(res.body);
      var data = convertDataToJson['records'];

      print(data);

      List<AirtableDataSkills> values = [];
      data.forEach(
        (value) {
          List<String> tempList = [];
          dynamic skills = value['fields']['skills'];
          skills.forEach((skill) {
            String url = skill['url'];
            tempList.add(url);
          });
          return values.add(
            AirtableDataSkills(
              id: value['id'],
              createdTime: value['createdTime'],
              domaine: value['fields']['domaine'],
              skills: tempList,
            ),
          );
        },
      );
      return values;
    } else {
      throw "ERROR !!!!!";
    }
  }
}
