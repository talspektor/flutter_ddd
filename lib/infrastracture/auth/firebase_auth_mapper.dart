import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ddd/domain/core/value_objects.dart';
import 'package:flutter_ddd/domain/auth/user.dart' as domain;

extension FirebaseUserDomainX on User {
  domain.User toDomain() {
    return domain.User(id: UniqueId.froUniqueString(uid));
  }
}
