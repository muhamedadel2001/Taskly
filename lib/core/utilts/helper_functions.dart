import 'package:my_asks/core/utilts/colors.dart';

class HelperFunctions {
  static getCol(int num) {
    switch (num) {
      case 0:
        return primaryClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return primaryClr;
    }
  }
}
