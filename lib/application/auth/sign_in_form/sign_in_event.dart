import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.freezed.dart';

@freezed
abstract class SingInFormEvent with _$SingInFormEvent {
  const factory SingInFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory SingInFormEvent.passwordChanged(String passwordStr) =
      PasswordChaned;
  const factory SingInFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SingInFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SingInFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
