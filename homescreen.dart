//import 'homescreen_widget.dart';
//import 'dart:html';
import 'package:bil/constant/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bil/Widget/header.dart';
import 'package:bil/model/posting.dart';
import 'package:bil/model/user.dart';
import 'package:bil/model/user.dart';
import 'package:bil/screens/home/chat.dart';
import 'package:bil/screens/home/notification.dart';
import 'package:bil/screens/home/timelinescreen.dart';
import 'package:bil/screens/post/post.dart';
import 'package:bil/screens/post/post_splash.dart';
import 'package:bil/screens/profile/profile.dart';

class homescreen extends StatefulWidget {
  final String currentUserId;
  final String visitedUserId;
  //final String visitedUserId;

  const homescreen({
    Key? key,
    //required this.visitedUserId,
    required this.currentUserId,
    required this.visitedUserId,
  }) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  //int _selectedTab = 0;
  // List<Widget> _homescreen = ;
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
          timelinescreen(
            currentUserId: widget.currentUserId,
          ),
          notifscreen(
            currentUserId: widget.currentUserId,
          ),
          post_splash(
            currentUserId: widget.currentUserId,
          ),
          chatscreen(),
          profilescreen(
              currentUserId: widget.currentUserId,
              visitedUserId: widget.visitedUserId),
        ].elementAt(_page),
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 450),
          buttonBackgroundColor: Colors.blue.shade50,
          height: 55,
          backgroundColor: BIL_Color,

          key: _bottomNavigationKey,
          items: <Widget>[
            new Tab(
                icon: new Image.asset(
              'assets/images/home.png',
              height: 27,
            )),
            new Tab(
                icon: new Image.asset(
              'assets/images/notification.png',
              height: 27,
            )),
            new Tab(
                icon: new Image.asset(
              'assets/images/instagram-post.png',
              height: 27,
            )),
            new Tab(
                icon: new Image.asset(
              'assets/images/chat.png',
              height: 27,
            )),
            new Tab(
                icon: new Image.asset(
              'assets/images/user.png',
              height: 27,
            )),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          //activeColor: Color(0xFF1C75BC),
        ));
  }
}
