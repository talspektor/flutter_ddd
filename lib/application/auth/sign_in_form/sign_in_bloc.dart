import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_event.dart';
import 'package:flutter_ddd/domain/auth/i_auth_facade.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SingInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;
  SignInBloc(this._authFacade) : super(SignInFormState.initial());
}
