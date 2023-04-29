import 'package:flutter/material.dart';

class PixelScale {
  static late BuildContext _context;

  static PixelScale of(BuildContext context) {
    _context = context;
    return PixelScale();
  }

  double width(double value) {
    assert(value <= 1);
    return MediaQuery.of(_context).size.width * value;
  }

  double height(double value) {
    assert(value <= 1);
    return MediaQuery.of(_context).size.height * value;
  }
}
