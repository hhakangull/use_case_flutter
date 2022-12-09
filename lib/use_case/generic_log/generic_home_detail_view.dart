import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/generic_log/core/logger_mixin.dart';

class GenericHomeDetailView extends StatefulWidget {
  const GenericHomeDetailView({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  State<GenericHomeDetailView> createState() => _GenericHomeDetailViewState();
}

class _GenericHomeDetailViewState extends State<GenericHomeDetailView> with LoggerMixin {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          widget.id,
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }

  @override
  PageSpacialKeys get key => PageSpacialKeys.detail;

  @override
  CustomModel get model => CustomModel(id: widget.id, description: "This is a detail Page");
}
