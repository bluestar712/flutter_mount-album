import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mount/data/models/album_model.dart';
import 'package:mount/helpers/constants.dart';

class MainApis{

  Future<List<AlbumModel>> fetchAlbums() async{

    final response = await http.get(Uri.parse(BaseUrl));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["results"];

      return json.map((album) => AlbumModel.fromMap(album)).toList();

    } else {
      throw Exception("Network error!");
    }
  }

}