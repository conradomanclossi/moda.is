import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final String reddit =
    'https://external-preview.redd.it/QJRqGgkUjhGSdu3vfpckrvg1UKzZOqX2BbglcLhjS70.png?auto=webp&s=c681ae9c9b5021d81b6c4e3a2830f09eff2368b5';

final String pinterest =
    'https://www.freepnglogos.com/uploads/pinterest-logo-emblem-png-11.png';

final String facebook =
    'https://facebookbrand.com/wp-content/uploads/2019/04/f_logo_RGB-Hex-Blue_512.png';

final String twitter =
    'https://uwm.edu/studentinvolvement/wp-content/uploads/sites/260/2017/12/twitter-icon-vector.png';

Widget smallBanner(_img) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      width: 285,
      height: 285,
      child: ClipRect(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                width: 285,
                height: 285,
                color: Colors.white.withOpacity(0),
                child: CustomPaint(
                  painter: ShapesPainter(),
                ),
              ),
            ),
            Positioned(
              left: 240,
              right: 0,
              top: 90,
              bottom: 0,
              child: Image(
                image: NetworkImage(reddit, scale: 2),
              ),
            ),
            Positioned(
              left: 240,
              right: 0,
              top: 190,
              bottom: 0,
              child: Image(
                image: NetworkImage(pinterest, scale: 40),
              ),
            ),
            Positioned(
              left: 185,
              right: 0,
              top: 230,
              bottom: 0,
              child: Image(
                image: NetworkImage(facebook, scale: 20),
              ),
            ),
            Positioned(
              left: 100,
              right: 0,
              top: 230,
              bottom: 0,
              child: Image(
                image: NetworkImage(twitter, scale: 1),
              ),
            ),
            Center(
              child: Transform.rotate(
                angle: 0.785,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5,
                          offset: Offset(10, 0)),
                    ],
                  ),
                  child: ClipRect(
                    child: Transform.scale(
                      scale: 1.5,
                      child: Transform.rotate(
                        angle: -0.785,
                        child: Image(
                          image: NetworkImage(_img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Transform.rotate(
                angle: 0.785,
                child: Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final redditPaint = Paint();
    final pinterestPaint = Paint();
    final facebookPaint = Paint();
    final twitterPaint = Paint();

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, 285, 285);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Color.fromRGBO(44, 44, 43, 1);
    redditPaint.color = Color.fromRGBO(255, 64, 32, 1);
    pinterestPaint.color = Color.fromRGBO(208, 25, 44, 1);
    facebookPaint.color = Color.fromRGBO(38, 118, 235, 1);
    twitterPaint.color = Color.fromRGBO(35, 171, 220, 1);

    // create a path
    var path = Path();
    path.lineTo(285, 285);
    path.lineTo(0, 285);
    path.lineTo(285, 0);
    path.lineTo(285, 285);
    path.close();
    canvas.drawPath(path, paint);

    // Reddit
    var reddit = Path();
    reddit.lineTo(285, 142.5);
    reddit.lineTo(285, 213.75);
    reddit.lineTo(213.75, 213.75);
    reddit.lineTo(285, 142.5);
    reddit.close();
    canvas.drawPath(reddit, redditPaint);

    // Pinterest
    var pinterest = Path();
    pinterest.lineTo(285, 285);
    pinterest.lineTo(213.75, 213.75);
    pinterest.lineTo(285, 213.75);
    pinterest.lineTo(285, 285);
    pinterest.close();
    canvas.drawPath(pinterest, pinterestPaint);

    // Facebook
    var facebook = Path();
    facebook.lineTo(285, 285);
    facebook.lineTo(213.75, 213.75);
    facebook.lineTo(213.75, 285);
    facebook.lineTo(285, 285);
    facebook.close();
    canvas.drawPath(facebook, facebookPaint);

    // Twitter
    var twitter = Path();
    twitter.lineTo(213.75, 213.75);
    twitter.lineTo(213.75, 285);
    twitter.lineTo(142.5, 285);
    twitter.lineTo(213.75, 213.75);
    twitter.close();
    canvas.drawPath(twitter, twitterPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
