import 'package:flutter_test/flutter_test.dart';
import 'package:use_case_flutter/use_case/cancelable_auto_complete/model/tv_show.dart';
import 'package:use_case_flutter/use_case/cancelable_auto_complete/service/tv_service.dart';
import 'package:vexana/vexana.dart';

void main() {
  late ITvService tvService;
  setUp(() {
    tvService = TvService(
      NetworkManager<TvShow?>(options: BaseOptions(baseUrl: 'https://api.tvmaze.com'), isEnableLogger: true),
    );
  });
  test('Fetch Kids Shows', () async {
    final response = await tvService.fetchItems('kids');
    print(response);
    expect(response, isNotNull);
  });
}
