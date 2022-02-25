// import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_bloc.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_event.dart';
import 'package:flutter_ddd/application/auth/sign_in_form/sign_in_state.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold((failure) {
            String text = '';
            failure.map(
              cancelledByUser: (_) {
                text = 'Cancelled By User';
              },
              serverError: (_) => 'Server Error',
              emailAlreadyInUse: (_) => text = 'Email Already In Use',
              invalidEmailAndPasswordCombination: (_) =>
                  text = 'Invalid Email And Password Combination',
            );
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(text),
            ));
            // FlushbarHelper.createError(
            //   message: failure.map(
            //     cancelledByUser: (_) => 'Cancelled By User',
            //     serverError: (_) => 'Server Error',
            //     emailAlreadyInUse: (_) => 'Email Already In Use',
            //     invalidEmailAndPasswordCombination: (_) =>
            //         'Invalid Email And Password Combination',
            //   ),
            // ).show(context);
          }, (_) {
            // TODO: Navigate
          }),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: ListView(
            children: [
              const Text(
                '📝',
                style: TextStyle(fontSize: 130),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .read<SignInBloc>()
                    .add(SingInFormEvent.emailChanged(value)),
                validator: (_) =>
                    context.read<SignInBloc>().state.emailAddress.value.fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => context
                    .read<SignInBloc>()
                    .add(SingInFormEvent.passwordChanged(value)),
                validator: (_) =>
                    context.read<SignInBloc>().state.password.value.fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) => 'Short Password',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInBloc>().add(
                              const SingInFormEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('SIGN IN'),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        context.read<SignInBloc>().add(
                              const SingInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('REGISTER'),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<SignInBloc>()
                      .add(const SingInFormEvent.signInWithGooglePressed());
                },
                style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
