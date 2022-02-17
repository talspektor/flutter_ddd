import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_address.freezed.dart';

class EmailAddress extends Equatable {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmilAddress(input));
  }

  const EmailAddress._(this.value);

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return 'EmailAddress: $value';
  }
}

Either<ValueFailure<String>, String> validateEmilAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-0.!#$%&'*+-/?^_`{|}]+@[a-zA-Z0-9]+\.[a-zA-Z]""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
}
