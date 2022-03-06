import 'package:bloc/bloc.dart';
import 'package:flutter_ddd/domain/auth/i_auth_facade.dart';
import 'package:injectable/injectable.dart';

import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial()) {
    on<AuthEvent>(_init);
  }

  void _init(AuthEvent event, Emitter<AuthState> emit) async {
    event.map(
      authCheckRequested: (event) async {
        final userOption = _authFacade.getSignedInUser();
        userOption.fold(
          () => emit(const AuthState.unauthenticated()),
          (_) => emit(
            const AuthState.authenticated(),
          ),
        );
      },
      signedOut: (event) async {
        await _authFacade.signOut();
        emit(const AuthState.unauthenticated());
      },
    );
  }
}
