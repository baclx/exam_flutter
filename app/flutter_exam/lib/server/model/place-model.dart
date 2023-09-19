class Place {

  String score;
  String linkImage;
  String namePlace;

  Place({required this.score, required this.linkImage, required this.namePlace});


  factory Place.fromJson(Map<String, dynamic> json){
    return Place(score: json['score']??'',
        linkImage: json['linkImage']??'',
        namePlace: json['namePlace']??'');
  }
}