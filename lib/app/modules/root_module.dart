import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../core/configurations/routes/app_api_routes.dart';
import '../core/packages/http_client/abstractions/i_http_client.dart';
import '../core/packages/http_client/implementations/http_client.dart';
import '../core/packages/local_storage_service/abstractions/i_local_storage_service.dart';
import '../core/packages/local_storage_service/implementations/local_storage_service.dart';
import '../core/transitions/transitions.dart';
import 'home/home_module.dart';
import 'splash/splash_module.dart';

class RootModule extends Module {
  @override
  void binds(Injector i) {
    // API Routes
    i.addSingleton(AppApiRoutes.api);

    // HTTP Client
    i.addSingleton(http.Client.new);
    i.addSingleton<IHttpClient>(
      (http.Client client) => HttpClient(
        client,
        automaticallyEncodeRequestBody: true,
      ),
    );

    // Local Storage
    i.addSingleton<ILocalStorageService>(LocalStorageService.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      '/',
      module: SplashModule(),
      transition: TransitionType.custom,
      customTransition: moduleTransition,
    );

    r.module(
      '/home',
      module: HomeModule(),
      transition: TransitionType.custom,
      customTransition: moduleTransition,
    );
  }
}
