import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/theme/app_colors.dart';
import 'package:money_mate/features/auth/cubit/login_cubit.dart';
import 'package:money_mate/features/auth/cubit/login_state.dart';
import 'package:money_mate/main.dart';
import 'package:money_mate/widgets/primary_button.dart';
import 'package:money_mate/widgets/primary_text_field.dart';

class LoginPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => sl<LoginCubit>(), child: _LoginView());
  }
}

class _LoginView extends StatefulWidget {
  const new();

  @override
  State<_LoginView> createState() => __LoginViewState();
}

class __LoginViewState extends State<_LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  Future<bool> _login() async {
    if (!_formKey.currentState!.validate()) return false;

    context.read<LoginCubit>().login(
      email: _emailController.text,
      password: _passswordController.text,
    );
    return true;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          final isLoading = state is LoginLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: .symmetric(horizontal: 16),
              child: Column(
                spacing: 8,
                mainAxisAlignment: .center,
                crossAxisAlignment: .stretch,
                children: [
                  const SizedBox(height: 40),
                  Image.asset(
                    "assets/images/money-mate.png",
                    width: 60,
                    height: 60,
                  ),

                  Text(
                    'Welcome Back!',
                    textAlign: .center,
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                  ),
                  Text(
                    'Manage your money with clarity, intention, \nand total peace of mind.',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: .w400,
                      fontSize: 14,
                    ),
                    textAlign: .center,
                  ),

                  const SizedBox(height: 20),

                  // Form
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 32,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          spacing: 20,
                          children: [
                            // Email
                            PrimaryTextField(
                              controller: _emailController,
                              label: 'Email Address',
                              hint: 'mgmg@example.com',
                              prefixIcon: Icons.email_outlined,
                              isEnable: !isLoading,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email address is required";
                                }
                                return null;
                              },
                            ),
                            PrimaryTextField(
                              controller: _passswordController,
                              label: 'Password',
                              hint: 'Enter your password',
                              isPassword: true,
                              isEnable: !isLoading,
                              obscureText: !isPasswordVisible,
                              prefixIcon: Icons.email_outlined,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  !isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.textMuted,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password is required";
                                }
                                if (value.length < 6) {
                                  return "Password must be at least 6 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                label: isLoading ? 'Loading...' : 'Login',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        _login();
                                      },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    spacing: 8,
                    mainAxisAlignment: .center,
                    children: [
                      Text("Don't have an account?"),
                      InkWell(
                        onTap: () => context.push("/signup"),
                        child: Text(
                          'Sign Up Free',
                          style: TextStyle(
                            decoration: .underline,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
