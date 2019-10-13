import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  String img =
      'https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Center(
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
                                  offset: Offset(10, 0)
                                ),
                              ],
                            ),
                            child: ClipRect(
                              child: Transform.scale(
                                scale: 1.5,
                                child: Transform.rotate(
                                  angle: -0.785,
                                  child: Image(
                                    image: NetworkImage(img),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 240,
                          right: 0,
                          top: 90,
                          bottom: 0,
                          child: Icon(Icons.cloud)),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final redditPaint = Paint();
    // set the paint color to be white

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, 285, 285);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Color.fromRGBO(44, 44, 43, 1);
    redditPaint.color = Color.fromRGBO(255, 64, 32, 1);
    // create a path
    var path = Path();
    path.lineTo(285, 0);
    path.lineTo(0, 285);
    path.lineTo(285, 285);
    path.lineTo(285, 0);
    //path.lineTo(x, y);
    // close the path to form a bounded shape
    var reddit = Path();
    reddit.lineTo(285, 142.5);
    reddit.lineTo(285, 213.75);
    reddit.lineTo(213.75, 213.75);
    reddit.lineTo(285, 142.5);
    reddit.close();

    path.close();
    canvas.drawPath(path, paint);
    canvas.drawPath(reddit, redditPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
