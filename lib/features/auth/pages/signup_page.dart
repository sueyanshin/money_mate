import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/extensions/snackbar_extension.dart';
import 'package:money_mate/core/theme/app_colors.dart';
import 'package:money_mate/features/auth/cubit/signup_cubit.dart';
import 'package:money_mate/features/auth/cubit/signup_state.dart';
import 'package:money_mate/main.dart';
import 'package:money_mate/widgets/primary_button.dart';
import 'package:money_mate/widgets/primary_text_field.dart';

class SignupPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => sl<SignUpCubit>(), child: _SignUpForm());
  }
}

class _SignUpForm extends StatefulWidget {
  const new();

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passswordController = TextEditingController();
  final TextEditingController _cPassswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isCPasswordVisible = false;

  Future<bool> _signUp() async {
    if (!_formKey.currentState!.validate()) return false;
    context.read<SignUpCubit>().signUp(
      fullName: _nameController.text,
      email: _emailController.text,
      password: _passswordController.text,
    );

    return true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passswordController.dispose();
    _cPassswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Register'), centerTitle: true),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpFailure) {
            context.showSnackBar(state.errorMessage);
          } else if (state is SignUpSuccess) {
            context.showSnackBar("Welcome, ${state.user.email}!");
          }
        },
        builder: (context, state) {
          final isLoading = state is SignUpLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: .symmetric(horizontal: 16),
              child: Column(
                spacing: 8,
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Create your account',
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                  ),
                  Text(
                    'Start taking control of your finances today',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: .w400,
                      fontSize: 14,
                    ),
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
                            // Name
                            PrimaryTextField(
                              controller: _nameController,
                              label: 'Full Name',
                              hint: 'Mg Mg',
                              isEnable: !isLoading,
                              prefixIcon: Icons.person,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Name is required";
                                }
                                return null;
                              },
                            ),
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

                            // Password
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
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
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
                            // Confirm Password
                            PrimaryTextField(
                              controller: _cPassswordController,
                              label: 'Confirm Password',
                              hint: 'Enter your password',
                              isPassword: true,
                              isEnable: !isLoading,
                              obscureText: !isCPasswordVisible,
                              prefixIcon: Icons.email_outlined,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isCPasswordVisible = !isCPasswordVisible;
                                  });
                                },
                                icon: Icon(
                                  isCPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.textMuted,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Re-enter your password";
                                }

                                if (_passswordController.text !=
                                    _cPassswordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                label: isLoading ? "Loading" : 'Sign Up',
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        _signUp();
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
                        onTap: () => context.pop(),
                        child: Text(
                          'Login',
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
