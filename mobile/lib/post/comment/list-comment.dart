import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/core/href.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/core/sizebox.dart';
import 'package:mobile/home/index.dart';
import 'package:mobile/home/partial/top-icon.dart';
import 'package:mobile/post/comment/partial/card-comment.dart';
import 'package:mobile/post/list-card.dart';
import 'package:mobile/vm/post-vm.dart';
import 'package:mobile/vm/sp.dart';

class DetailCommentScreen extends StatefulWidget {
  final int data;
  DetailCommentScreen({this.data});
  @override
  _DetailCommentScreenState createState() => _DetailCommentScreenState();
}

class _DetailCommentScreenState extends State<DetailCommentScreen> {
  bool typed = false;
  bool editedCaption = false;
  Map data;
  TextEditingController x = new TextEditingController();
  bool _loading = true;
  String dataCaption = '';
  editPosts() {
    PostVM.updatePost(data['id'].toString(), x.text).then((value) {
      print(value);
      setState(() {
        dataCaption = x.text;
        x.text = '';
        typed = false;
        editedCaption = false;
      });
    });
  }

  st() {
    PostVM.detail(widget.data.toString()).then((value) {
      return Timer(Duration(seconds: 2), () {
        setState(() {
          data = value;
          dataCaption = data["value"];
          _loading = false;
        });
      });
    });
  }

  List valueList = [];
  store() async {
    if (x.text != '') {
      var nm = await SP.getOthers('username');
      PostVM.storeComment(data['id'].toString(), x.text).then((value) {
        setState(() {
          valueList.add({
            'username': nm,
            'value': x.text,
            'time': 'baru saja',
          });
          x.text = '';
          typed = false;
        });
      });
    }
  }

  @override
  void initState() {
    st();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Padding(
              padding: EdgeInsets.only(left: displayWidth(context) * 0.025),
              child: Icon(Icons.arrow_back_ios),
            ),
            onPressed: () {
              Routes.stfR(context, InstaHome());
            }),
        backgroundColor: new Color(0xfff8faf8),
        elevation: 0,
        title: Text(
          "Komentar",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: ScrollController(initialScrollOffset: 999999),
              children: [
                SizedBox(height: 10),
                if (_loading) ...[
                  CardComment(
                    isComment: false,
                    loading: true,
                  ),
                  for (var i = 0; i < 3; i++) ...{
                    CardComment(
                      loading: true,
                    ),
                  }
                ] else ...[
                  CardComment(
                    fun: () {
                      setState(() {
                        editedCaption = true;
                        x.text = dataCaption;
                      });
                      // print("ASA");
                    },
                    isComment: false,
                    loading: false,
                    username: data["user"]["username"],
                    value: dataCaption,
                    createdat: data["created_at"],
                  ),
                  for (var item in data['comment']) ...{
                    CardComment(
                      username: item["user_comment"]["username"],
                      value: item['value'],
                      createdat: item["created_at"],
                      loading: false,
                    ),
                  },
                  for (var itemAdded in valueList) ...{
                    CardComment(
                      username: itemAdded["username"],
                      value: itemAdded['value'],
                      createdat: itemAdded["time"],
                      loading: false,
                    ),
                  }
                ]
              ],
            ),
          ),
          _sendMessageArea()
        ],
        // height: displayHeight(context),
        // width: displayWidth(context),
      ),
    );
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            onChanged: (xy) {
              if (xy != '') {
                setState(() {
                  typed = true;
                });
              }
            },
            controller: x,
            decoration: InputDecoration(
                suffixIcon: typed
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            typed = false;
                            x.text = '';
                            editedCaption = false;
                          });
                        },
                        child: Icon(Icons.cancel))
                    : SizedBox(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 17.5, vertical: 1),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.black45, fontSize: 12),
                hintText: "Type in your text",
                fillColor: Colors.white70),
          )),
          TextButton(
            onPressed: () {
              editedCaption ? editPosts() : store();
            },
            child: Text(
              "Kirim",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Colors.blueAccent,
                  letterSpacing: 0.4),
            ),
          )
        ],
      ),
    );
  }
}
