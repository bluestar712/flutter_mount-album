import 'package:flutter/material.dart';
import 'package:mount/data/providers/album_provider.dart';
import 'package:mount/src/pages/main_album_page.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mount Album",
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => AlbumProvider(),
        child: MainAlbumPage(),
      ),
    );
  }
}
