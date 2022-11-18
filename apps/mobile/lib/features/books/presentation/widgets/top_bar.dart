import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 5.0, right: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Maciej',
            style: Theme.of(context).textTheme.headline3,
          ),
          IconButton(
            icon: const Icon(
              Icons.logout_rounded,
              size: 35.0,
            ),
            onPressed: () => context.read<AuthBloc>().add(LogOutEvent()),
          )
        ],
      ),
    );
  }
}
