import 'package:flutter/material.dart';
import 'package:mobile/core/button.dart';
import 'package:mobile/core/href.dart';
import 'package:mobile/core/input.dart';
import 'package:mobile/core/shimmer/state.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/core/sizebox.dart';
import 'package:mobile/home/index.dart';
import 'package:mobile/vm/post-vm.dart';

class LikersScreen extends StatefulWidget {
  final int id;
  LikersScreen(this.id);
  @override
  _LikersScreenState createState() => _LikersScreenState();
}

class _LikersScreenState extends State<LikersScreen> {
  TextEditingController cari = new TextEditingController();
  List data = [];
  List dataReal = [];
  bool loading = true;
  void getData() {
    PostVM.showLike(widget.id.toString()).then((value) {
      setState(() {
        data = value;
        dataReal = value;
        loading = false;
      });
    });
  }

  void cariKata(String kata) {
    print(kata);
    for (var item in dataReal) {
      if (item['user']['username'].toString().toLowerCase().contains(kata)) {
        setState(() {
          data.clear();
          data.add(item);
        });
      }
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Suka",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.05),
        child: Column(
          children: [
            Verticals(15),
            Column(
              children: [
                Container(
                    height: 50,
                    child: Input(
                      paddingVertical: 0,
                      size: 12,
                      controller: cari,
                      method: (e) {
                        cariKata(e);
                      },
                      placeholder: "Cari disini",
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: displayHeight(context) - 180,
              width: displayWidth(context),
              child: ListView(
                children: [
                  for (var i = 0; i < data.length; i++) ...{
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      width: displayWidth(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Skeleton(
                                width: 60,
                                height: 60,
                                loading: loading,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(102109)),
                                doneWidget: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://ca-times.brightspotcdn.com/dims4/default/87029f9/2147483647/strip/true/crop/1611x906+0+0/resize/840x472!/format/webp/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ffd%2Fef%2F05c1aab3e76c3d902aa0548c0046%2Fla-la-hm-pet-issue-18-jpg-20150615"),
                                    ),
                                  ),
                                ),
                              ),
                              Horizontals(displayWidth(context) * 0.025),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Skeleton(
                                    width: displayWidth(context) * 0.25,
                                    height: 14,
                                    loading: loading,
                                    doneWidget: Text(
                                      data[i]['user']['username'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          letterSpacing: 0.4),
                                    ),
                                  ),
                                  Verticals(5),
                                  Skeleton(
                                    width: displayWidth(context) * 0.15,
                                    height: 14,
                                    loading: loading,
                                    doneWidget: Container(
                                      width: displayWidth(context) * 0.4,
                                      child: Text(
                                        data[i]['user']['name'],
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            letterSpacing: 0.4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Skeleton(
                              width: displayWidth(context) * 0.3,
                              height: 30,
                              loading: loading,
                              doneWidget: Button(
                                height: 30,
                                percents: 0.3,
                                isi: "Ikuti",
                                colorText: Colors.white,
                                colorButton: Colors.blue,
                              )),
                        ],
                      ),
                    )
                  }
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
