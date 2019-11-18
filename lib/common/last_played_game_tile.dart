import 'package:flutter/material.dart';
import 'package:flutter_stadia_app/model/last_played_game.dart';
import 'package:flutter_stadia_app/style_guide/color.dart';
import 'package:flutter_stadia_app/style_guide/text_style.dart';

import 'game_progress_widget.dart';

class LastPlayedGameTile extends StatelessWidget {
  final LastPlayedGame lastPlayedGame;
  final double screenWidth;

  const LastPlayedGameTile({this.lastPlayedGame, this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset(lastPlayedGame.imagePath)),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
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
                      lastPlayedGame.name,
                      style: headingTwoTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${lastPlayedGame.hoursPlayed} hours played',
                      style: bodyTextStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          GameProgressWidget(lastPlayedGame.gameProgress, screenWidth)
        ],
      ),
    );
  }
}