import 'package:ieee_flutter_app/view/travel/model/travel_response_model.dart';
import 'package:vexana/vexana.dart';

enum TravelServicePath { fetchTravelInformation }

extension TravelServicePathExtension on TravelServicePath {
  String get path {
    switch (this) {
      case TravelServicePath.fetchTravelInformation:
        return '/api/shared/fetchTravelData';
      default:
        return '';
    }
  }
}

abstract class ITravelService {
  late final INetworkManager _manager;
  ITravelService(INetworkManager manager) : _manager = manager;

  Future<TravelResponseModel?> fetchTravelInformation();
}

class TravelService extends ITravelService {
  TravelService(INetworkManager manager) : super(manager);

  @override
  Future<TravelResponseModel?> fetchTravelInformation() async {
    final response = await _manager.send<TravelResponseModel, TravelResponseModel>(
      TravelServicePath.fetchTravelInformation.path,
      parseModel: TravelResponseModel(),
      method: RequestType.GET,
    );

    return response.data;
  }
}
