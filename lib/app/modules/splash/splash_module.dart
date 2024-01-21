import 'package:flutter_modular/flutter_modular.dart';

import '../../core/transitions/transitions.dart';
import 'pages/splash_page.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const SplashPage(),
      transition: TransitionType.custom,
      customTransition: routeTransition,
    );
  }
}
