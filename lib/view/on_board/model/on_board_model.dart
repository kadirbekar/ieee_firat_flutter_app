import 'package:ieee_flutter_app/core/constants/image_constants.dart';

class OnBoarModel {
  final String title;
  final String imagePath;

  const OnBoarModel({required this.title, required this.imagePath});

  static List<OnBoarModel> onBoardList = [
    OnBoarModel(title: "Create Your \n Route", imagePath: ImageConstants.instance.icFirstOnBoard),
    OnBoarModel(title: "Invite Other \n Hickers", imagePath: ImageConstants.instance.icSecondOnBoard),
    OnBoarModel(title: "Have a great \n Day", imagePath: ImageConstants.instance.icThirdOnBoard)
  ];
}
