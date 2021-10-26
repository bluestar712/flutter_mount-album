import 'package:flutter/material.dart';
import 'package:mount/data/providers/album_provider.dart';
import 'package:mount/data/viewmodels/album_view_model.dart';
import 'package:mount/helpers/constants.dart';
import 'package:provider/provider.dart';

class AlbumItem extends StatelessWidget {

  final AlbumViewModel model;
  AlbumItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: disable_color
      ),
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: model.image != ""
                ? FadeInImage.assetNetwork(
                  placeholder: 'assets/img/spinner-sm.gif',
                  image: model.image,
                  width: 80,
                  height: 80,
                )
                : Container(
                    height: 80,
                    width: 80,
                    child: Image.asset('assets/img/unknown.png'),
                ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      model.album_name,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: sec_color,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      model.price != "" ? '\u0024' + model.price : "Free",
                      style: TextStyle(
                          color: sec_color
                      ),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: Text(
                      model.releaseDate != "" ? model.releaseDate : "",
                      style: TextStyle(
                        color: sec_color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: InkWell(
              onTap: (){
                Provider.of<AlbumProvider>(context, listen: false).toggleFollow(model);
              },
              child: model.follow
                  ? Icon(Icons.star, color: sec_color)
                  : Icon(Icons.star_border, color: sec_color)
            ),
          ),
        ],
      )
    );
  }
}
