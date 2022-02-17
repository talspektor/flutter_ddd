import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/core/failures.dart';

Either<ValueFailure<String>, String> validateEmilAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-0.!#$%&'*+-/?^_`{|}]+@[a-zA-Z0-9]+\.[a-zA-Z]""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}
