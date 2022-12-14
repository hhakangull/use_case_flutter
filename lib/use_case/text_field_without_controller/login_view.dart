import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/text_field_without_controller/clear_action.dart';

mixin LoginController on State<LoginView> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginController {
  late final ClearTextAction textAction;
  late final ControllerCleaner _controllerCleaner;
  // ignore: unused_field
  String _value = '';
  @override
  void initState() {
    super.initState();
    textAction = ClearTextAction();
    _controllerCleaner = ControllerCleaner(textAction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _homeButton(),
          _removeButton(),
        ],
      ),
      body: Column(
        children: [
          _CustomTextField(
            action: textAction,
            onChange: (String value) {
              _value = value;
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton _homeButton() {
    return FloatingActionButton.large(
      onPressed: () {
        _controllerCleaner.update('Home');
      },
      child: const Icon(Icons.home),
    );
  }

  FloatingActionButton _removeButton() {
    return FloatingActionButton(
      child: const Icon(Icons.clear),
      onPressed: () {
        //textAction.invoke(ClearTextIntent(_value));
        _controllerCleaner.clear();
      },
    );
  }
}

class _CustomTextField extends StatelessWidget {
  _CustomTextField({
    Key? key,
    required this.action,
    required this.onChange,
  }) : super(key: key);
  final ClearTextAction action;
  final TextEditingController controller = TextEditingController();
  final void Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return ActionListener(
      action: action,
      listener: (action) {
        if (action is ClearTextAction) {
          if (action.text.isEmpty) {
            controller.clear();
          } else {
            controller.text = action.text;
          }
        }
      },
      child: TextField(
        onChanged: onChange,
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ControllerCleaner {
  final ClearTextAction _clearTextAction;

  ControllerCleaner(ClearTextAction clearTextAction) : _clearTextAction = clearTextAction;

  void clear() {
    //_clearTextAction.invoke(ClearTextIntent(title));
    _clearTextAction.invoke(const ClearTextIntent());
  }

  void update(String title) {
    _clearTextAction.invoke(ClearTextIntent(text: title));
  }
}
