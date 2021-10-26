import 'package:mount/data/models/album_model.dart';

class AlbumViewModel{

  final AlbumModel albumModel;

  AlbumViewModel({required this.albumModel});

  String get album_name{

    if(this.albumModel.album_name != null){
      return this.albumModel.album_name!;
    }else{
      return "";
    }
  }

  String get price{

    if(this.albumModel.price != null){
      return this.albumModel.price!.toString();
    }else{
      return "";
    }
  }

  String get releaseDate{

    if(this.albumModel.release_date != null){
      String date = this.albumModel.release_date!.split("T")[0];
      return date;
    }else{
      return "";
    }
  }

  String get image{

    if(this.albumModel.album_image != null){
      return this.albumModel.album_image!;
    }else{
      return "";
    }
  }

  bool get follow{
    return this.albumModel.follow;
  }

  void toggle_follow(){
    this.albumModel.follow = !this.albumModel.follow;
  }

}