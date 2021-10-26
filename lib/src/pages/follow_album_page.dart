import 'package:flutter/material.dart';
import 'package:mount/data/providers/album_provider.dart';
import 'package:mount/helpers/constants.dart';
import 'package:mount/src/widgets/album_item.dart';
import 'package:provider/provider.dart';

class FollowAlbumPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sec_color,
      body: Container(
        child: Consumer<AlbumProvider>(

            builder: (context, components, child){
              return Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: ListView.builder(
                  itemCount: components.followAlbums.length,
                  itemBuilder: (_, index){
                    return AlbumItem(model: components.followAlbums[index]);
                  },
                ),
              );
            }
        ),
      ),
    );
  }
}
