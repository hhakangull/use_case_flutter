import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/cancelable_auto_complete/model/durations.dart';
import 'package:use_case_flutter/use_case/cancelable_auto_complete/model/errors.dart';
import 'package:use_case_flutter/use_case/cancelable_auto_complete/model/tv_show.dart';
import 'package:use_case_flutter/use_case/cancelable_auto_complete/service/tv_service.dart';
import 'package:vexana/vexana.dart';

class AutoCancelable extends StatefulWidget {
  const AutoCancelable({Key? key}) : super(key: key);
  @override
  State<AutoCancelable> createState() => _AutoCancelableState();
}

class _AutoCancelableState extends State<AutoCancelable> with _AutoCancel {
  @override
  void initState() {
    super.initState();
    tvService = TvService(
        NetworkManager<TvShow?>(options: BaseOptions(baseUrl: 'https://api.tvmaze.com'), isEnableLogger: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Autocomplete<TvShow>(
              displayStringForOption: (option) => option.show?.name ?? '',
              optionsBuilder: (textEditingValue) async {
                //return await tvService.fetchItems(textEditingValue.text) ?? [];
                return await search(textEditingValue.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

mixin _AutoCancel on State<AutoCancelable> {
  late final ITvService tvService;

  CancelableOperation<void>? _cancelableOperation;
  FutureOr<List<TvShow>> search(String key) async {
    _cancelableOperation?.cancel();

    _cancelableOperation = CancelableOperation.fromFuture(Future.delayed(Durations.normal.value), onCancel: () {
      ErrorsMixin.print('Operations is canceled');
    });
    List<TvShow> items = [];
    await _cancelableOperation?.value.then((result) async {
      items = await tvService.fetchItems(key) ?? [];
    });

    return items;
  }
}
