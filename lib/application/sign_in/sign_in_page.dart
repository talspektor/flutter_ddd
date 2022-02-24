import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/application/sign_in/widgets/sign_in_form.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_state.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_bloc.dart';
import 'package:flutter_ddd/injection.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInBloc>(),
        child: BlocBuilder<SignInBloc, SignInFormState>(
          builder: (context, state) {
            return const SignInForm();
          },
        ),
      ),
    );
  }
}
