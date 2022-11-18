import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/widgets/login_form.dart';

import '../../../../core/presentation/widgets/uelogo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UELogo(),
                AnimatedCrossFade(
                  crossFadeState: state is AuthLoadingState
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                  firstChild: Container(
                    width: 400.0,
                    padding: const EdgeInsets.only(top: 20.0, bottom: 100.0),
                    child: Text(
                      'Student library application project',
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  secondChild: const SizedBox(
                    height: 40.0,
                    width: 400,
                  ),
                ),
                AnimatedCrossFade(
                  crossFadeState: state is AuthLoadingState
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                  firstChild: const LoginForm(),
                  secondChild: const SizedBox(
                    width: 420.0,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
