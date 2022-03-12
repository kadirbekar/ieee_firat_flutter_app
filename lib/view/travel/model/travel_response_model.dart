import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'travel_response_model.g.dart';

@JsonSerializable(createToJson: false)
class TravelResponseModel extends INetworkModel<TravelResponseModel> {
  TravelResponseModel({
    this.isOk,
    this.message,
    this.data,
  });

  final bool? isOk;
  final String? message;
  final Data? data;

  @override
  TravelResponseModel fromJson(Map<String, dynamic> json) {
    return _$TravelResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() => null;
}

@JsonSerializable(createToJson: false)
class Data {
  const Data({
    this.upComingRoutes,
    this.discoverMore,
  });

  final List<DiscoverMore>? upComingRoutes;
  final List<DiscoverMore>? discoverMore;

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class DiscoverMore {
  const DiscoverMore({
    this.imageUrl,
    this.title,
    this.information,
    this.status,
  });

  final String? imageUrl;
  final String? title;
  final String? information;
  final String? status;
  IconData? get icon => TravelStatus.values.byName(status?.toLowerCase() ?? '').iconData;

  factory DiscoverMore.fromJson(Map<String, dynamic> json) {
    return _$DiscoverMoreFromJson(json);
  }
}

enum TravelStatus { join, maybe, joined }

extension TravelStatusExtension on TravelStatus {
  IconData? get iconData {
    switch (this) {
      case TravelStatus.join:
        return Icons.add;
      case TravelStatus.joined:
        return Icons.done_all;
      case TravelStatus.maybe:
        return Icons.timelapse_sharp;
      default:
        return null;
    }
  }
}
