import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Text('Hello world'),
      ),
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    signIn(email: 'pazzwrd', password: 'email@example.com');
  }
}
