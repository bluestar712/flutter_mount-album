class AlbumModel{
  String? album_name;
  String? album_image;
  double? price;
  String? release_date;
  bool follow;

  AlbumModel({
    this.album_image,
    this.price,
    this.album_name,
    this.release_date,
    required this.follow
  });

  factory AlbumModel.fromMap(Map<String, dynamic> json){
    return AlbumModel(
      album_name: json['artistName'],
      album_image: json['artworkUrl100'],
      price: json['collectionPrice'],
      release_date: json['releaseDate'],
      follow: false
    );
  }
}