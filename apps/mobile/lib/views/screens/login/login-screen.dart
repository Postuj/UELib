import 'package:flutter/material.dart';
import 'package:mobile/views/common/uelogo.dart';
import 'package:mobile/views/screens/login/widgets/login-form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAuthInProgress = false;
  void onLogin(String email, String password) async {
    setState(() {
      _isAuthInProgress = true;
    });

    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isAuthInProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UELogo(),
            AnimatedCrossFade(
              crossFadeState: _isAuthInProgress
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
              crossFadeState: _isAuthInProgress
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              firstChild: LoginForm(
                onLogin: onLogin,
              ),
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
        ),
      ),
    );
  }
}
