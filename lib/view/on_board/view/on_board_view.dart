import 'package:flutter/material.dart';
import 'package:ieee_flutter_app/core/constants/widget_size.dart';
import 'package:ieee_flutter_app/core/widgets/button/custom_elevated_button.dart';
import 'package:ieee_flutter_app/view/on_board/model/on_board_model.dart';
import 'package:ieee_flutter_app/view/travel/view/travel_home_view.dart';

import 'package:kartal/kartal.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  late ValueNotifier<int> _selectedPage;
  late ValueNotifier<int> _currentItem;

  @override
  void initState() {
    super.initState();
    _selectedPage = ValueNotifier<int>(0);
    _currentItem = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _selectedPage.dispose();
    _currentItem.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            onPageChanged: (int) {
              _selectedPage.value = int;
            },
            itemCount: OnBoarModel.onBoardList.length,
            itemBuilder: (BuildContext context, int index) {
              final item = OnBoarModel.onBoardList[index];
              Future.microtask(() {
                _currentItem.value = index;
              });
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(item.imagePath), fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: context.height * 0.2,
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline2,
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
              bottom: WidgetSize.size40,
              child: CustomElevatedButton(
                onPressed: () =>  _navigateToTravelView(context),
              )),
          Positioned(
            bottom: WidgetSize.size20,
            child: Row(
              children: List.generate(OnBoarModel.onBoardList.length, (index) {
                return ValueListenableBuilder(
                    valueListenable: _currentItem,
                    builder: (_, int currentItemValue, __) {
                      return ValueListenableBuilder(
                        valueListenable: _selectedPage,
                        builder: (_, int currentIndex, __) {
                          return SizedBox(
                            height: WidgetSize.size20,
                            width: WidgetSize.size20,
                            child: Card(
                              color: currentItemValue == currentIndex
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          );
                        },
                      );
                    });
              }),
            ),
          ),
        ],
      ),
    );
  }

   void _navigateToTravelView(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => TravelHomeView()));
  }
}
