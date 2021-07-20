import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
  final double cornersize;
  final double diagonalelement;
  final bool roundedbtn;
  AppClipper(this.cornersize, this.diagonalelement, {this.roundedbtn = true});
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, cornersize * 1.5);
    path.lineTo(0, size.height - (roundedbtn ? cornersize : 0));
    if (roundedbtn) {
      path.quadraticBezierTo(0, size.height, cornersize, size.height);
    }

    path.lineTo(size.width - (roundedbtn ? cornersize : 0), size.height);
    if (roundedbtn) {
      path.quadraticBezierTo(
          size.width, size.height, size.width, size.height - cornersize);
    }
    path.lineTo(size.width, diagonalelement + cornersize);
    path.quadraticBezierTo(size.width, diagonalelement, size.width - cornersize,
        diagonalelement * .9);

    path.lineTo(cornersize * 2, cornersize);

    path.quadraticBezierTo(0, 0, 0, cornersize);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
