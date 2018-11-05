class Tip {
  final int id;
  final String image;
  final String title;
  final String tip;
  bool favorite = false;

  Tip({this.id, this.image, this.title, this.tip});

  setFavorite() {
    favorite = favorite ? false : true;
  }
}
