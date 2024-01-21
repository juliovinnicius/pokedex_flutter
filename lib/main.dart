import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/root_module.dart';
import 'app/modules/root_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: RootModule(),
      child: const RootWidget(),
    ),
  );
}
