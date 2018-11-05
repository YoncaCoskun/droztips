import 'package:droztips/models/tip.dart';

class Api {
  List<Tip> list;
  var tempList = [];

  Future<List<Tip>> getData() async {
    //TODO ımplement firebase
    //var response = await http.get(
    //Uri.encodeFull("https://quizzesdb.firebaseio.com/droz_diet_tips.json"),
    //headers: {"Accept": "application/json"});
    //list = json.decode(response.body);
    return _createDummyData();
  }

  Future<List<Tip>> _createDummyData() async {
    Tip card1 = Tip(
        id: 1,
        image: 'assets/photo1.png',
        tip: "Deneme1",
        title: " Title1 deneme");

    Tip card2 = Tip(
        id: 2,
        image: 'assets/photo2.jpeg',
        tip: "Deneme2",
        title: " Title2 deneme");

    Tip card3 = Tip(
        id: 3,
        image: 'assets/photo4.png',
        tip: "Deneme3",
        title: " Title3 deneme");

    Tip card4 = Tip(
        id: 4,
        image: 'assets/photo5.jpg',
        tip: "Deneme4",
        title: " Title4 deneme");

    list = [card1, card2, card3, card4];

    return list;
  }
}

Api api = Api();
