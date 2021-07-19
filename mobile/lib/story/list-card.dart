import 'package:flutter/material.dart';

class InstaStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (var i = 0; i < 7; i++) ...{
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.25),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://ca-times.brightspotcdn.com/dims4/default/87029f9/2147483647/strip/true/crop/1611x906+0+0/resize/840x472!/format/webp/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ffd%2Fef%2F05c1aab3e76c3d902aa0548c0046%2Fla-la-hm-pet-issue-18-jpg-20150615")),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  i == 0
                      ? Positioned(
                          right: 10.0,
                          child: Container(
                            padding: EdgeInsets.all(2.5),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                                border: Border.all(
                                    color: Colors.white, width: 1.25)),
                          ),
                        )
                      : Positioned(
                          left: -1,
                          top: -1,
                          bottom: -1,
                          right: -1,
                          child: Container(
                              width: 67.5,
                              height: 67.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.red, width: 1.5),
                              )),
                        )
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Cerita Anda",
                style: TextStyle(
                    fontSize: 11, color: Colors.black87, letterSpacing: 0.4),
              )
            ],
          )
        }
      ],
    );
  }
}
