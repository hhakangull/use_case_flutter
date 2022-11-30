import 'package:use_case_flutter/use_case/cancelable_auto_complete/model/tv_show.dart';
import 'package:vexana/vexana.dart';

abstract class ITvService {
  ITvService(NetworkManager networkManager) : _manager = networkManager;

  Future<List<TvShow>?> fetchItems(String key);

  final INetworkManager _manager;
}

class TvService extends ITvService {
  TvService(super.networkManager);

  @override
  Future<List<TvShow>?> fetchItems(String key) async {
    final response = await _manager.send<TvShow, List<TvShow>>(_TvServicePath.search.withDivider,
        urlSuffix: _TvServicePath.shows.withDivider,
        queryParameters: Map.fromEntries([_Queries.q.value(key)]),
        parseModel: TvShow(),
        method: RequestType.GET);

    return response.data;
  }
}

//https://api.tvmaze.com/search/shows?q=men

enum _TvServicePath {
  search,
  shows;

  String get withDivider => '/$name';
  // String show(String key) => '/$name/?';
}

enum _Queries {
  q;

  MapEntry<String, String> value(String value) => MapEntry(name, value);
}
