import 'package:flutter/material.dart';
import 'package:flutter_ddd/application/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: SignInPage(),
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    signIn(email: 'pazzwrd', password: 'email@example.com');
  }
}
