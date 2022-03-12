import 'package:vexana/vexana.dart';

class NetworkService {
  static NetworkService? _instance;
  static NetworkService get instance =>
      _instance ??= NetworkService._initialize();

  late final INetworkManager _networkManager;
  INetworkManager get networkManager => _networkManager;

  final String _baseUrl = 'https://reyclist.herokuapp.com';

  void initializeNetworkSettings() {
    _networkManager = NetworkManager(options: BaseOptions(baseUrl: _baseUrl));
  }

  NetworkService._initialize();
}
