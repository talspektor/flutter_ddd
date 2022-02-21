import 'package:freezed_annotation/freezed_annotation.dart';

part of '';

@freezed
abstract class SingFormEvent with _$SingFormEvent {
  const factory SingFormEvent.emailChanged(String emailStr) = EmaiChanged;
  const factory SingFormEvent.passwordChanged(String emailStr) = PasswordChaned;
  const factory SingFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory SingFormEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory SingFormEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
