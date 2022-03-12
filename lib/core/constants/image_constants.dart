class ImageConstants {
  ImageConstants._initialize();

  static const String png = "assets/images/png";
  static const String svg = "assets/images/svg";

  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ?? ImageConstants._initialize();

  final String icFirstOnBoard = '$png/ic_first_on_board.png';
  final String icSecondOnBoard = '$png/ic_second_on_board.png';
  final String icThirdOnBoard = '$png/ic_third_on_board.png';
}
