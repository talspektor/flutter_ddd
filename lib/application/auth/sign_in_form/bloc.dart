import 'package:bloc/bloc.dart';

import 'sign_in_event.dart';
import 'state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(Initial()) {}
}
