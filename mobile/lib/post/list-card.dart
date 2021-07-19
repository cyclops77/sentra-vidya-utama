import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/href.dart';
import 'package:mobile/core/server.dart';
import 'package:mobile/core/shimmer/state.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/core/sizebox.dart';
import 'package:mobile/post/like.dart';
import 'package:mobile/post/partial/icon-part.dart';
import 'package:mobile/vm/post-vm.dart';

class InstaList extends StatefulWidget {
  final Map data;
  final StatefulWidget page;
  final bool loading;
  final List liker;
  InstaList({this.page, this.data, this.loading, this.liker});
  @override
  _InstaListState createState() => _InstaListState();
}

class _InstaListState extends State<InstaList> {
  bool isLikes;
  int nomor = 0;
  inta() {
    if (isLikes == null && widget.liker.contains(widget.data['id'])) {
      setState(() {
        nomor = -1;
      });
    } else if (isLikes != null && widget.liker.contains(widget.data['id'])) {
      setState(() {
        nomor = -1;
      });
    } else if (isLikes == null && !widget.liker.contains(widget.data['id'])) {
      setState(() {
        nomor = 1;
      });
    } else if (isLikes != null && !widget.liker.contains(widget.data['id'])) {
      setState(() {
        nomor = 1;
      });
    }
  }

  @override
  void initState() {
    // inta();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.035),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Skeleton(
                      width: 32.5,
                      height: 32.5,
                      loading: widget.loading,
                      borderRadius: BorderRadius.all(Radius.circular(102109)),
                      doneWidget: Container(
                        height: 32.5,
                        width: 32.5,
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
                    Skeleton(
                      width: displayWidth(context) * 0.15,
                      height: 13,
                      loading: widget.loading,
                      doneWidget: Text(
                        widget.loading ? "" : widget.data['user']['username'],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            letterSpacing: 0.4),
                      ),
                    ),
                  ],
                ),
                Skeleton(
                    loading: widget.loading,
                    width: displayWidth(context) * 0.075,
                    height: 22,
                    doneWidget: Icon(
                      CupertinoIcons.ellipsis_vertical,
                      color: Colors.black87,
                      size: 18,
                    )),
              ],
            ),
          ),
          Verticals(7.5),
          Skeleton(
            width: displayWidth(context),
            height: 275,
            loading: widget.loading,
            doneWidget: Container(
              height: 275,
              // margin: EdgeInsets.only(top: 7.5),
              width: displayWidth(context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.loading
                          ? ""
                          : Server.storageEndPoint +
                              "post/" +
                              widget.data['image']))),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: 8.5, horizontal: displayWidth(context) * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Skeleton(
                      loading: widget.loading,
                      width: displayWidth(context) * 0.075,
                      height: 22,
                      doneWidget: IconPart(
                        fun: () {
                          PostVM.likes(widget.data['id'].toString())
                              .then((value) {
                            setState(() {
                              if (isLikes == null) {
                                isLikes =
                                    !widget.liker.contains(widget.data['id']);
                              } else {
                                isLikes = !isLikes;
                              }
                            });
                            print(value.toString());
                          });
                        },
                        ikon: widget.loading
                            ? Icons.favorite
                            : isLikes == null
                                ? widget.liker.contains(widget.data['id'])
                                    ? Icons.favorite
                                    : Icons.favorite_border
                                : isLikes
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                        warna: widget.loading
                            ? Colors.red
                            : isLikes == null
                                ? widget.liker.contains(widget.data['id'])
                                    ? Colors.red
                                    : Colors.black
                                : isLikes
                                    ? Colors.red
                                    : Colors.black,
                        right: displayWidth(context) * 0.04,
                      ),
                    ),
                    Skeleton(
                      loading: widget.loading,
                      width: displayWidth(context) * 0.075,
                      height: 22,
                      doneWidget: IconPart(
                        fun: () {
                          Routes.stfR(context, widget.page);
                        },
                        ikon: CupertinoIcons.chat_bubble,
                        right: displayWidth(context) * 0.04,
                      ),
                    ),
                    Skeleton(
                      loading: widget.loading,
                      width: displayWidth(context) * 0.075,
                      height: 22,
                      doneWidget: IconPart(
                        ikon: Icons.send,
                        right: displayWidth(context) * 0.04,
                      ),
                    )
                  ],
                ),
                Skeleton(
                  loading: widget.loading,
                  width: displayWidth(context) * 0.075,
                  height: 22,
                  doneWidget: IconPart(
                    ikon: Icons.bookmark_border,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.035),
                width: displayWidth(context),
                child: Skeleton(
                  loading: widget.loading,
                  height: 13,
                  width: displayWidth(context) * 0.075,
                  doneWidget: InkWell(
                    onTap: () {
                      Routes.stfR(context, LikersScreen(widget.data['id']));
                    },
                    child: Text(
                      widget.loading
                          ? ""
                          : (widget.data['like_count'] + nomor).toString() +
                              " suka",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          letterSpacing: 0.5),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: displayWidth(context) * 0.035),
                width: displayWidth(context),
                margin: EdgeInsets.only(top: 5),
                child: Skeleton(
                  loading: widget.loading,
                  height: 13,
                  width: displayWidth(context),
                  quantity: 3,
                  doneWidget: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.loading
                              ? ""
                              : widget.data['user']["username"] + " ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.black,
                              letterSpacing: 0.5),
                        ),
                        TextSpan(
                          text: widget.loading ? "" : widget.data['value'],
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black87,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Routes.stfR(context, widget.page);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: displayWidth(context) * 0.035),
                    width: displayWidth(context),
                    margin: EdgeInsets.only(top: 10),
                    child: Skeleton(
                      loading: widget.loading,
                      width: displayWidth(context) * 0.2,
                      height: 12,
                      doneWidget: Text(
                        widget.loading
                            ? ""
                            : "Lihat semua " +
                                widget.data['comment_count'].toString() +
                                " Komentar",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.black38,
                            letterSpacing: 0.4),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
