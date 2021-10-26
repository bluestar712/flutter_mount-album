import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:mount/data/apis/main_apis.dart';
import 'package:mount/data/viewmodels/album_view_model.dart';

class AlbumProvider extends ChangeNotifier{

  List<AlbumViewModel> albums = [];

  List<AlbumViewModel> get followAlbums => UnmodifiableListView(albums.where((element) => element.follow));

  Future<void> fetchAlbums() async{

    final results = await MainApis().fetchAlbums();

    this.albums = results.map((item) => AlbumViewModel(albumModel: item)).toList();

    notifyListeners();
  }

  void toggleFollow(AlbumViewModel model){

    model.toggle_follow();

    notifyListeners();
  }
}