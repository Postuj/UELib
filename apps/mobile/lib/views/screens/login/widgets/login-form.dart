import 'package:flutter/material.dart';

import '../../../common/or-separator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  final Function(String, String) onLogin;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void loginBtnClick() {
    widget.onLogin('', '');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                label: Text('Email'),
                suffixIcon: Icon(Icons.mail_outline_rounded),
              ),
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: _passwordController,
              style: Theme.of(context).textTheme.bodyText2,
              obscureText: _isPasswordHidden,
              decoration: InputDecoration(
                label: const Text('Password'),
                suffixIcon: TextButton(
                  onPressed: () =>
                      setState(() => _isPasswordHidden = !_isPasswordHidden),
                  child: _isPasswordHidden
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: loginBtnClick,
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
