import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

// configureInjection(String env) {
//   getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
//   getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
//   getIt.registerLazySingleton<FirebaseAuthFacade>(
//       () => FirebaseAuthFacade(getIt(), getIt()));
//   getIt.registerFactory<SignInBloc>(
//       () => SignInBloc(getIt.get<FirebaseAuthFacade>()));
//   getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<FirebaseAuthFacade>()));
// }

@injectableInit
configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}
