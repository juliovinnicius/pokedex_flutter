import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_flutter/app/core/configurations/hive/hive_initiliazation.dart';

import 'app/modules/root_module.dart';
import 'app/modules/root_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  hiveInitialization(
    onInitialized: () {
      runApp(
        ModularApp(
          module: RootModule(),
          child: const RootWidget(),
        ),
      );
    },
  );
}
