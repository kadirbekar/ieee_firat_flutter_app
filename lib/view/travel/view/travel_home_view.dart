import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ieee_flutter_app/core/constants/widget_size.dart';
import 'package:ieee_flutter_app/core/design/app_theme.dart';
import 'package:ieee_flutter_app/core/design/widget_padding.dart';
import 'package:ieee_flutter_app/core/service/network/network_service.dart';
import 'package:ieee_flutter_app/core/widgets/appbar/appbar_icon.dart';
import 'package:ieee_flutter_app/view/travel/model/travel_response_model.dart';
import 'package:ieee_flutter_app/view/travel/service/travel_service.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

class TravelHomeView extends StatefulWidget {
  const TravelHomeView({Key? key}) : super(key: key);

  @override
  _TravelHomeViewState createState() => _TravelHomeViewState();
}

class _TravelHomeViewState extends State<TravelHomeView> {
  TravelResponseModel? _travelResponse;
  late final ITravelService _service;

  bool _isLoading = false;

  final SizedBox _sizedBox10 = const SizedBox(height: 10);

  @override
  void initState() {
    super.initState();
    _service = TravelService(NetworkService.instance.networkManager);
    _fetchTravelInformation();
  }

  Future<void> _fetchTravelInformation() async {
    _updateLoadingState();
    final response = await _service.fetchTravelInformation();
    _updateLoadingState();
    setState(() => _travelResponse = response);
  }

  void _updateLoadingState() => setState(() => _isLoading = !_isLoading);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'WikiLycian',
          style: TextStyle(color: AppTheme.orange),
        ),
        actions: const [
          AppbarIcon(iconData: Icons.home),
          AppbarIcon(iconData: Icons.person),
          AppbarIcon(iconData: Icons.android),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const WidgetPadding.all16(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upcoming routes',
                          style: context.textTheme.headline4,
                        ),
                        Text('See all', style: context.textTheme.bodyText1)
                      ],
                    ),
                    _sizedBox10,
                    SizedBox(
                      height: context.height * 0.4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _travelResponse?.data?.upComingRoutes?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = _travelResponse?.data?.upComingRoutes?[index];
                          return Card(
                            child: Padding(
                              padding: const WidgetPadding.all12(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(WidgetSize.size16),
                                    child: Image.network(item?.imageUrl ?? '', height: 150),
                                  ),
                                  _sizedBox10,
                                  Text(
                                    item?.title ?? '',
                                    style: context.textTheme.bodyText1,
                                  ),
                                  _sizedBox10,
                                  Row(
                                    children: [
                                      const Icon(Icons.home),
                                      Text(
                                        item?.information ?? '',
                                        style: context.textTheme.bodyText1?.copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  _sizedBox10,
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppTheme.orange,
                                      borderRadius: BorderRadius.circular(
                                        WidgetSize.size12,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const WidgetPadding.all12(),
                                      child: Row(
                                        children: [
                                          Icon(item?.icon, color: Colors.white),
                                          const SizedBox(
                                            width: WidgetSize.size10,
                                          ),
                                          Text(
                                            item?.status ?? '',
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
