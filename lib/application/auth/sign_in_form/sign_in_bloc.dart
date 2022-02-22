import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_event.dart';
import 'package:flutter_ddd/domain/auth/auth_failure.dart';
import 'package:flutter_ddd/domain/auth/i_auth_facade.dart';
import 'package:flutter_ddd/domain/auth/value_objects.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SingInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SingInFormEvent>((event, emit) => event.map(
          emailChanged: (e) {
            emit(state.copyWith(
              emailAddress: EmailAddress(e.emailStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          passwordChanged: (e) {
            emit(state.copyWith(
              password: Password(e.passwordStr),
              authFailureOrSuccessOption: none(),
            ));
          },
          registerWithEmailAndPasswordPressed: (e) async {
            _performActionOnAuthFacadeWithEmailAndPassword(
                emit, _authFacade.registerWithEmailAndPassword);
          },
          signInWithEmailAndPasswordPressed: (e) async {
            _performActionOnAuthFacadeWithEmailAndPassword(
                emit, _authFacade.signInWithEmailAndPassword);
          },
          signInWithGooglePressed: (e) async {
            emit(state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ));
            final failureOrSuccess = await _authFacade.signInWithGoogle();
            emit(state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(failureOrSuccess),
            ));
          },
        ));
  }

  _performActionOnAuthFacadeWithEmailAndPassword(
    Emitter emit,
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  ) async {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));

      failureOrSuccess = await forwardedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );

      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: some(failureOrSuccess),
      ));
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
