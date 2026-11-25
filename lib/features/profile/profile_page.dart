import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/features/auth/cubit/signup_cubit.dart';
import 'package:money_mate/main.dart';

class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignUpCubit>(),
      child: _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignUpCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Text('Profile Page'),
              ElevatedButton(
                onPressed: () {
                  context.read<SignUpCubit>().signOut();
                },
                child: Text("Sign out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
