import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_stadia_app/common/last_played_game_tile.dart';
import 'package:flutter_stadia_app/common/radial_image_widget.dart';
import 'package:flutter_stadia_app/common/ui_helper.dart';
import 'package:flutter_stadia_app/model/friends.dart';
import 'package:flutter_stadia_app/model/last_played_game.dart';
import 'package:flutter_stadia_app/pages/second_page.dart';
import 'package:flutter_stadia_app/style_guide/asset_paths.dart';
import 'package:flutter_stadia_app/style_guide/color.dart';
import 'package:flutter_stadia_app/style_guide/text_style.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double logoHeight = screenHeight * 0.4;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Transform.translate(
                offset: Offset(screenWidth * 0.4, 10),
                child: Transform.rotate(
                    angle: -0.1,
                    child: Icon(Icons.person_add,
                        size: logoHeight, color: logoTintColor))),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: primaryTextColor,
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SecondPage()))),
                        IconButton(
                            icon: Icon(
                              Icons.search,
                              color: primaryTextColor,
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RadialImage(
                              imageUrl: player1,
                              isOnline: true,
                              name: '',
                              score: 39,
                              showScore: true,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Hello\nJohn Snow',
                              style: usernameTextStyle,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              elevation: 4.0,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: 'HOURS PLAYED\n\n',
                                      style: hoursPlayedLabelTextStyle),
                                  TextSpan(
                                      text: '297 Hours',
                                      style: hoursPlayedTextStyle)
                                ])),
                              ),
                            ),
                          ),
                        ),
                        contentHeading('Last played games'),
                        for (int i = 0; i < lastPlayedGames.length; i++)
                          LastPlayedGameTile(
                            lastPlayedGame: lastPlayedGames[i],
                            screenWidth: screenWidth,
                          ),
                        contentHeading('Friends'),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 106,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: friendList.length,
                        itemBuilder: (context, index) {
                          Friends friend = friendList[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: RadialImage(
                              imageUrl: friend.imageUrl,
                              isOnline: friend.isOnline,
                              name: friend.name,
                              score: 0,
                              showScore: false,
                              imageSize: 80,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
