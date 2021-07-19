import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/shimmer/state.dart';
import 'package:mobile/core/size.dart';
import 'package:mobile/core/sizebox.dart';

class CardComment extends StatelessWidget {
  // final Map data;
  // final Map capt;
  final Function fun;
  final String username, value, createdat;
  final bool isComment, loading;
  CardComment({
    this.fun,
    this.isComment = true,
    this.loading = true,
    // this.capt,
    this.username,
    this.value,
    this.createdat,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 17.5),
          padding:
              EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(
                    loading: loading,
                    width: 32.5,
                    height: 32.5,
                    borderRadius: BorderRadius.all(Radius.circular(9999)),
                    doneWidget: Container(
                      height: 32.5,
                      width: 32.5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://ca-times.brightspotcdn.com/dims4/default/87029f9/2147483647/strip/true/crop/1611x906+0+0/resize/840x472!/format/webp/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ffd%2Fef%2F05c1aab3e76c3d902aa0548c0046%2Fla-la-hm-pet-issue-18-jpg-20150615"))),
                    ),
                  ),
                  Horizontals(displayWidth(context) * 0.025),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: isComment
                            ? displayWidth(context) -
                                32.5 -
                                displayWidth(context) * 0.195
                            : displayWidth(context) -
                                32.5 -
                                displayWidth(context) * 0.125,
                        child: Skeleton(
                          height: 14,
                          width: displayWidth(context),
                          loading: loading,
                          quantity: 3,
                          doneWidget: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: isComment
                                      ? loading
                                          ? ""
                                          : username
                                              // data["user_comment"]["username"] +
                                              +
                                              "  "
                                      : loading
                                          ? ""
                                          : username
                                              // capt["user"]["username"]
                                              +
                                              "  ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black,
                                      letterSpacing: 0.5),
                                ),
                                TextSpan(
                                  text: isComment
                                      ? loading
                                          ? ""
                                          : value
                                      // data['value']
                                      : loading
                                          ? ""
                                          : value,
                                  // capt["value"],
                                  // "Another cool thing about using RichText widget is that, the TextSpan the object comes with their own TapGestureRecognizer() which helps to implement onTap() action on specific parts of the text as needed. In our example, since the user can tap on Sign up text to navigate to the desired screen, we’ll make use of recognizer property that makes the text tappable, as shown in the entire code snippet below:",
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
                      Verticals(7.5),
                      Row(
                        children: [
                          Skeleton(
                            loading: loading,
                            height: 12,
                            width: displayWidth(context) * 0.125,
                            doneWidget: Text(
                              isComment
                                  ? loading
                                      ? ""
                                      : createdat
                                  // data['created_at']
                                  : loading
                                      ? ""
                                      : createdat,
                              // capt['created_at'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.black38,
                                  letterSpacing: 0.4),
                            ),
                          ),
                          if (isComment) ...[
                            Horizontals(displayWidth(context) * 0.035),
                            Skeleton(
                              loading: loading,
                              height: 12,
                              width: displayWidth(context) * 0.125,
                              doneWidget: Text(
                                "Balas",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black38,
                                    letterSpacing: 0.4),
                              ),
                            ),
                          ] else ...[
                            Horizontals(displayWidth(context) * 0.035),
                            Skeleton(
                              loading: loading,
                              height: 12,
                              width: displayWidth(context) * 0.125,
                              doneWidget: InkWell(
                                onTap: fun,
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.black38,
                                      letterSpacing: 0.4),
                                ),
                              ),
                            ),
                            Horizontals(displayWidth(context) * 0.025),
                            Skeleton(
                              loading: loading,
                              height: 12,
                              width: displayWidth(context) * 0.125,
                              doneWidget: Text(
                                "Hapus",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black38,
                                    letterSpacing: 0.4),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              if (isComment) ...[
                Icon(
                  Icons.favorite_border,
                  size: 16,
                )
              ]
            ],
          ),
        ),
        if (!isComment) ...[
          Container(
            margin: EdgeInsets.only(bottom: 17.5),
            height: 0.3,
            width: displayWidth(context),
            color: Colors.black38,
          )
        ]
      ],
    );
  }
}
