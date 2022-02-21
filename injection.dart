import 'package:injectable/injectable.dart';

@injectableInit
configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
