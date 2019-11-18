import 'package:flutter/material.dart';
import 'package:flutter_stadia_app/common/ui_helper.dart';
import 'package:flutter_stadia_app/model/last_played_game.dart';
import 'package:flutter_stadia_app/style_guide/asset_paths.dart';
import 'package:flutter_stadia_app/style_guide/color.dart';
import 'package:flutter_stadia_app/style_guide/text_style.dart';

import 'landing_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  game_sekiro,
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5),
                ),
                Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LandingPage()))),
                              IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {})
                            ],
                          ),
                        ),
                      ),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'NEW GAME\n', style: newGameLabelTextStyle),
                          TextSpan(
                              text: 'Sekiro: Shadows Die Twice',
                              style: newGameNameTextStyle)
                        ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                        decoration: BoxDecoration(
                          gradient: appGradient,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text('Play',
                            style: bodyTextStyle.copyWith(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: contentHeading('Popular with friends'),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: popularWithFriends
                        .map(
                          (s) => Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      s,
                                      fit: BoxFit.cover,
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 155,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 6,
                                  left: 20,
                                  right: 20,
                                  child: Material(
                                    elevation: 4,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          color: Colors.white),
                                      child: Text(
                                        'Play',
                                        style: bodyTextStyle.copyWith(
                                            color: firstColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: contentHeading('Continue Playing'),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        gradient: appGradient,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          width: 60,
                          height: 90,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: Stack(
                              children: <Widget>[
                                Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                        lastPlayedGames[0].imagePath)),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: firstColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              lastPlayedGames[0].name,
                              style: headingTwoTextStyle.copyWith(
                                  color: Colors.white, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${lastPlayedGames[0].hoursPlayed} hours played',
                              style: bodyTextStyle.copyWith(
                                  color: Colors.white, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Icon(
          Icons.search,
          color: firstColor,
        ),
      ),
    );
  }
}
