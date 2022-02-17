import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/core/failures.dart';
import 'package:flutter_ddd/core/value_objects.dart';
import 'package:flutter_ddd/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmilAddress(input));
  }

  const EmailAddress._(this.value);
}

class PasswordAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PasswordAddress(String input) {
    return PasswordAddress._(validatePassword(input));
  }

  const PasswordAddress._(this.value);
}
