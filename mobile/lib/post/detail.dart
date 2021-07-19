import 'package:flutter/material.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/home/partial/top-icon.dart';
import 'package:mobile/post/comment/list-comment.dart';
import 'package:mobile/post/list-card.dart';

class DetailPostScreen extends StatefulWidget {
  final Map data;
  DetailPostScreen({this.data});
  @override
  _DetailPostScreenState createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final topBar = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    elevation: 0,
    title: Text(
      "Postingan",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        child: ListView(
          children: [
            SizedBox(height: 10),
            InstaList(
              page: DetailCommentScreen(
                data: widget.data['comment'],
                // capt: widget.data,
              ),
              data: widget.data,
            ),
          ],
        ),
      ),
    );
  }
}
