import 'package:auto_route/annotations.dart';
import 'package:flutter_ddd/application/sign_in/sign_in_page.dart';
import 'package:flutter_ddd/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SplashPage, initial: true),
  ],
)
class $AppRouter {}
