import 'package:droztips/models/tip.dart';

class Api {
  List<Tip> list;
  var tempList = [];

  Future<List<Tip>> getData() async {
    return _createDummyData();
  }

  Future<List<Tip>> _createDummyData() async {
    Tip card1 = Tip(
        id: '1',
        image: 'assets/photo1.png',
        tip:
            "Başlamakta zorluk mu çekiyorsunuz? İlk adım olarak kendinize bir yemek yeme not defteri ya da yürüyüş ayakkabısı alın. Bu tarz davranışlar, amaca ulaşma başarısını üç kat artırır.",
        title: "Başlamakta zorluk mu çekiyorsunuz?");

    Tip card2 = Tip(
        id: '2',
        image: 'assets/photo2.jpeg',
        tip:
            "Öğünlerinizde 22 santimetrelik tabaklar kullanın. Aslında çocuk yemek tabakları, bir yetişkini doyurabilecek ebatlardadır.",
        title: "Öğünler");

    Tip card3 = Tip(
        id: '3',
        image: 'assets/photo4.png',
        tip:
            "Zeytin, somon ve ceviz gibi sağlıklı yağlar içeren yiyecekler, tatmin olmanıza yardım edecektir.",
        title: "Sağlıklı yiyecekler");

    Tip card4 = Tip(
        id: '4',
        image: 'assets/photo5.jpg',
        tip:
            "Dışarıda yemek eğlenceli olabilir, garsona ekmeği, karışık atıştırmalıkları, cips ve sosları getirmemesini söyleyin.",
        title: "Dışarda yemek yenildiğinde ne yapılabilir?");

    Tip card5 = Tip(
        id: '5',
        image: 'assets/photo5.jpg',
        tip:
            "Yemek planlamayı otomatikleştirin. Ne yiyeceğinizi vakitlice planlarsanız, son dakikada yapacağınız sağlıksız yemek seçimi riskini, en aza indirebilirsiniz.",
        title: "Yemeğini planla");

    Tip card6 = Tip(
        id: '6',
        image: 'assets/photo5.jpg',
        tip:
            "Kızarmış besinlere alışık olabilirsiniz. Ama ızgara, buğulama, haşlama, fırınlama ve buharda pişirme gibi birçok sağlıklı yemek pişirme şekilleri de mevcut.",
        title: "Sağlıklı yemekler!");

    list = [card1, card2, card3, card4, card5, card6];

    return list;
  }
}

Api api = Api();
