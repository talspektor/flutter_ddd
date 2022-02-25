import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_bloc.dart';
import 'package:flutter_ddd/infrastracture/auth/firebase_auth_facade.dart';
// import 'package:flutter_ddd/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'application/auth/sign_in_form/sign_in_bloc.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

configureInjection(String env) {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  getIt.registerLazySingleton<FirebaseAuthFacade>(
      () => FirebaseAuthFacade(getIt(), getIt()));
  getIt.registerFactory<SignInBloc>(
      () => SignInBloc(getIt.get<FirebaseAuthFacade>()));
}

// @injectableInit
// configureInjection(String env) {
//   $initGetIt(getIt, environment: env);
// }
