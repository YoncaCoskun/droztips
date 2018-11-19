class Tip {
  final String id;
  final String image;
  final String title;
  final String tip;
  bool favorite = false;

  Tip({this.id, this.image, this.title, this.tip});

  factory Tip.fromJson(Map<String, dynamic> json) {
    return new Tip(
      id: json['id'].toString(),
      title: json['title'].toString(),
      tip: json['tip'].toString(),
      image: json['image'].toString(),
    );
  }

  setFavorite() {
    favorite = favorite ? false : true;
  }
}
