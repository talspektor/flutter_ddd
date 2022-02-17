import 'package:flutter_ddd/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
}

void showingTheEmailAddressOrFailure() {
  final emailAddress = EmailAddress('sdfgfdsg');

  String emailText = emailAddress.value.fold(
    (left) => 'Failure happened, more precisely',
    (right) => right,
  );

  String emailAddress2 =
      emailAddress.value.getOrElse(() => 'Some failure happened');
}
