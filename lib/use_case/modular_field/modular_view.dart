import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ModularView extends StatefulWidget {
  const ModularView({Key? key}) : super(key: key);
  @override
  State<ModularView> createState() => _ModularViewState();
}

class _ModularViewState extends State<ModularView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modular View"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [CustomButton(title: "Login"), CustomNetworkImage(url: '')],
      ),
    );
  }
}
