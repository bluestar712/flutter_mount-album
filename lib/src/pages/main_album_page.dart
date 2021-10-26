import 'package:flutter/material.dart';
import 'package:mount/data/providers/album_provider.dart';
import 'package:mount/helpers/constants.dart';
import 'package:mount/src/pages/all_album_page.dart';
import 'package:mount/src/pages/follow_album_page.dart';
import 'package:provider/provider.dart';

class MainAlbumPage extends StatefulWidget {

  @override
  _MainAlbumPageState createState() => _MainAlbumPageState();
}

class _MainAlbumPageState extends State<MainAlbumPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<AlbumProvider>(context, listen: false).fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mount Album')
      ),
      body: DefaultTabController(
        length: 2,
        child: Consumer<AlbumProvider>(
          builder: (context, component, child){
            return Scaffold(
              backgroundColor: main_color,
              appBar: TabBar(
                labelColor: sec_color,
                unselectedLabelColor: disable_color,
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.list)),
                  Tab(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.star),
                          Text('( ${component.followAlbums.length} )')
                        ],
                      ),
                    ),
                  )
                ],
              ),
              body: TabBarView(
                children: <Widget>[
                  AllAlbumPage(),
                  FollowAlbumPage()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
