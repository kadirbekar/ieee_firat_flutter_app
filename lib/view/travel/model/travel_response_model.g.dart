// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TravelResponseModel _$TravelResponseModelFromJson(Map<String, dynamic> json) =>
    TravelResponseModel(
      isOk: json['isOk'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      upComingRoutes: (json['upComingRoutes'] as List<dynamic>?)
          ?.map((e) => DiscoverMore.fromJson(e as Map<String, dynamic>))
          .toList(),
      discoverMore: (json['discoverMore'] as List<dynamic>?)
          ?.map((e) => DiscoverMore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DiscoverMore _$DiscoverMoreFromJson(Map<String, dynamic> json) => DiscoverMore(
      imageUrl: json['imageUrl'] as String?,
      title: json['title'] as String?,
      information: json['information'] as String?,
      status: json['status'] as String?,
    );
