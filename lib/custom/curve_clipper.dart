import 'package:flutter/cupertino.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 39);

    var firstControlPoint = Offset(size.width / 4, size.height - 73);
    var firstPoint = Offset(size.width/2,size.height-73);
    
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstPoint.dx, firstPoint.dy);

    // 第二个控制点和第二点变量。
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height - 73.0);
    // 第二个中间曲线变量。
    var secondPoint = Offset(size.width, size.height - 39.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
