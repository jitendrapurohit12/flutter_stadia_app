import 'package:flutter_stadia_app/style_guide/asset_paths.dart';

class Friends{
  String name, imageUrl;
  bool isOnline;

  Friends({this.name, this.imageUrl, this.isOnline = false});

}

final friendList = [
  Friends(name: 'Jennie', imageUrl: friend_jennie, isOnline: true),
  Friends(name: 'Gena', imageUrl: friend_gena, isOnline: false),
  Friends(name: 'Michelle', imageUrl: friend_michelle, isOnline: false),
  Friends(name: 'Trish', imageUrl: friend_trish, isOnline: false),
  Friends(name: 'Gena', imageUrl: friend_gena, isOnline: false),
  Friends(name: 'Michelle', imageUrl: friend_michelle, isOnline: false),
  Friends(name: 'Trish', imageUrl: friend_trish, isOnline: false),
];