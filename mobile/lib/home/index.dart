import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/auth/login.dart';
import 'package:mobile/core/href.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/home/partial/bottom-icon.dart';
import 'package:mobile/home/partial/top-icon.dart';
import 'package:mobile/post/comment/list-comment.dart';
import 'package:mobile/post/create.dart';
import 'package:mobile/post/list-card.dart';
import 'package:mobile/story/list-card.dart';
import 'package:mobile/vm/post-vm.dart';

class InstaHome extends StatefulWidget {
  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  List data = [];
  List likes = [];
  bool _loading = true;
  getIndex() {
    PostVM.index().then((value) {
      return Timer(Duration(seconds: 2), () {
        setState(() {
          data = value['data'];
          likes = value['likes'];
          _loading = false;
        });
      });
    });
  }

  @override
  void initState() {
    getIndex();
    // TODO: implement initState
    super.initState();
  }

  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    elevation: 0,
    title: SizedBox(
        height: 37.5, child: Image.asset("assets/images/insta_logo.png")),
    actions: [
      TopIcon(CupertinoIcons.plus_app),
      TopIcon(Icons.favorite_border),
      TopIcon(Icons.send),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      bottomNavigationBar: Container(
        height: 50.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          elevation: 0,
          color: Color(0xfff8faf8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomIcon(Icons.home, () {}),
              BottomIcon(CupertinoIcons.search, () {}),
              BottomIcon(CupertinoIcons.plus_app, () {
                Routes.stfR(context, CreatePostScreen());
              }),
              BottomIcon(CupertinoIcons.bag, () {}),
              BottomIcon(CupertinoIcons.person_alt_circle, () {
                Routes.stfR(context, LoginScreen());
              }),
            ],
          ),
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: ListView(
          children: [
            Container(
              margin:
                  EdgeInsets.only(left: displayWidth(context) * 0.04, top: 5),
              height: 85,
              width: displayWidth(context),
              child: InstaStories(),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 0.5,
              color: Colors.black12,
            ),
            SizedBox(height: 10),
            if (_loading) ...[
              InstaList(
                page: DetailCommentScreen(data: 0),
                data: null,
                liker: likes,
                loading: _loading,
              ),
              InstaList(
                page: DetailCommentScreen(data: 0),
                data: null,
                liker: likes,
                loading: _loading,
              ),
            ] else ...[
              for (var item in data) ...{
                InstaList(
                  liker: likes,
                  page: DetailCommentScreen(data: item['id']),
                  data: item,
                  loading: _loading,
                ),
              }
            ]
          ],
        ),
      ),
    );
  }
}
