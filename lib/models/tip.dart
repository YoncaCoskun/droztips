class Tip {
  final int id;
  final String image;
  final String title;
  final String tip;

  Tip({this.id, this.image, this.title, this.tip});
}

final sampleItems = <Tip>[
  new Tip(
      id: 1,
      image: 'assets/photo1.png',
      tip: "Deneme1",
      title: " Title1 deneme"),
  new Tip(
    id: 2,
    image: 'assets/photo2.jpeg',
    tip: "Deneme2",
    title: " Title2 deneme",
  ),
  new Tip(
    id: 3,
    image: 'assets/photo4.png',
    tip: "Deneme3",
    title: " Title3 deneme",
  ),
];
