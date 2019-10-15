import 'package:flutter/material.dart';
import 'dart:math' as math;

class HeroPage extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = const Interval(
      0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero 动画示例'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        alignment: FractionalOffset.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHero(
                context,
                'https://cdn.pixabay.com/user/2018/05/28/23-31-09-916_250x250.jpg',
                'Chikilino'),
            _buildHero(
                context,
                'https://cdn.pixabay.com/user/2018/12/28/22-17-08-435_250x250.jpg',
                'Peggychoucair'),
            _buildHero(
                context,
                'https://cdn.pixabay.com/user/2019/06/14/22-01-06-22_250x250.jpg',
                'mollyroselee'),
          ],
        ),
      ),
    );
  }

  _buildPage(BuildContext context, String imageName, String description) {
    return Container(
      color: Theme
          .of(context)
          .canvasColor,
      child: Center(
        child: Card(
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                    tag: imageName,
                    createRectTween: _createRectTween,
                    child: RadialExpansion(
                      maxRadius: kMaxRadius,
                      child: Photo(
                        photo: imageName,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                ),
              ),
              Text(description,style: TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 3.0,),
              SizedBox(height: 16,)
            ],
          ),
        ),
      ),

    );
  }

  _buildHero(BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2,
      height: kMinRadius * 2,
      child: Hero(
          tag: imageName,
          child: RadialExpansion(
            maxRadius: kMaxRadius,
            child: Photo(
              photo: imageName,
              onTap: () {
                Navigator.of(context).push(
                    PageRouteBuilder(pageBuilder: (BuildContext context,
                        Animation<double>animation,
                        Animation<double> secondaryAnimation) {
                      return AnimatedBuilder(animation: animation,
                          builder: (BuildContext context, Widget child) {
                            return Opacity(
                              opacity: opacityCurve.transform(animation.value),
                              child: _buildPage(
                                  context, imageName, description)
                            );
                          });
                    })
                );
              },
            ),
          )
      ),
    );
  }
}

class Photo extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const Photo({Key key, this.photo, this.onTap, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme
          .of(context)
          .primaryColor
          .withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(builder: (context, size) {
          return Image.network(
            photo,
            fit: BoxFit.contain,
          );
        }),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final double clipRectSize;
  final Widget child;

  const RadialExpansion({Key key, this.maxRadius, this.child})
      : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}
