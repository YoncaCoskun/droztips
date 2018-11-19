import 'dart:convert';
import 'package:droztips/models/tip.dart';
import 'package:http/http.dart' as http;

class FirebaseRepo {
  Future<List<Tip>> getDataFirebase() async {
    var response =
        await http.get("https://quizzesdb.firebaseio.com/droz_diet_tips.json");
    var responseJson = json.decode(response.body);
    var list =
        (responseJson['tips'] as List).map((p) => Tip.fromJson(p)).toList();
    return list;
  }
}

FirebaseRepo firebase = FirebaseRepo();
