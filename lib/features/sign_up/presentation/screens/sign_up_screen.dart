import 'package:antiques_furniture/config/router.dart';
import 'package:antiques_furniture/core/utils/app_colors.dart';
import 'package:antiques_furniture/core/utils/app_images.dart';
import 'package:antiques_furniture/core/utils/app_text_theme.dart';
import 'package:antiques_furniture/core/utils/app_validators.dart';
import 'package:antiques_furniture/core/utils/padding_extention.dart';
import 'package:antiques_furniture/core/utils/widget_utility_extention.dart';
import 'package:antiques_furniture/features/login/presentation/providers/auth_provider.dart';
import 'package:antiques_furniture/widgets/primary_button.dart';
import 'package:antiques_furniture/widgets/primary_textFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final success = await context.read<AuthProvider>().signUp(
            _nameController.text,
            _emailController.text,
            _passwordController.text,
          );

      if (success) {
        if (!mounted) return;
        context.go(AppRoutes.homeScreenRoute);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.read<AuthProvider>().errorMessage)),
        );
      }
    }
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Image.asset(
            AppImages.auth_bg_wood,
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          SafeArea(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.17),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: 32,
                        bottom: 20,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "ANTIQUES",
                              style: AppTextTheme.logoStyle(
                                color: Colors.brown,
                                fontSize: 24,
                                weight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Furniture",
                              style: AppTextTheme.logoStyle(
                                color: AppColors.primaryColor,
                                weight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                30.heightBox,
                                Text(
                                  "Create Account",
                                  style: AppTextTheme.h4(
                                    weight: FontWeight.bold,
                                  ),
                                ).pOnly(left: 6),
                                8.heightBox,
                                Text(
                                  'Please enter your name, email and password to create your account.',
                                  style: AppTextTheme.bodyMedium(
                                    color: AppColors.lightGrey,
                                  ).copyWith(fontSize: 15),
                                ).pOnly(left: 6),
                              ],
                            ),
                            20.heightBox,
                            PrimaryTextField(
                              controller: _nameController,
                              hintText: "Enter your name",
                              labelText: "Name",
                              prefixIcon: const Icon(Icons.person),
                              validator: Validators.validateName,
                            ),
                            12.heightBox,
                            PrimaryTextField(
                              controller: _emailController,
                              hintText: "Enter your Email",
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                              validator: Validators.validateEmail,
                            ),
                            12.heightBox,
                            PrimaryTextField(
                              controller: _passwordController,
                              hintText: "Enter your Password",
                              labelText: "Password",
                              obscureText: !_passwordVisible,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: _passwordVisible
                                    ? const Icon(
                                        Icons.visibility,
                                        color: AppColors.lightGrey,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                          AppImages.svg_eye_closed,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.lightGrey,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              validator: Validators.validatePassword,
                            ),
                            12.heightBox,

                            PrimaryTextField(
                              controller: _confirmPasswordController,
                              hintText: "Confirm your Password",
                              labelText: "Confirm Password",
                              obscureText: !_confirmPasswordVisible,
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: _confirmPasswordVisible
                                    ? const Icon(
                                        Icons.visibility,
                                        color: AppColors.lightGrey,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                          AppImages.svg_eye_closed,
                                          colorFilter: const ColorFilter.mode(
                                            AppColors.lightGrey,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                onPressed: () {
                                  setState(() {
                                    _confirmPasswordVisible =
                                        !_confirmPasswordVisible;
                                  });
                                },
                              ),
                              validator: _validateConfirmPassword,
                            ),
                            22.heightBox,
                            PrimaryButton(
                              text: authProvider.state == AuthState.authenticating
                                  ? 'Signing Up...'
                                  : 'Sign Up',
                              onTap: _submit,
                              isDisabled: authProvider.state == AuthState.authenticating,
                            ),
                            5.heightBox,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: AppTextTheme.bodyMedium(
                                    weight: FontWeight.w500,
                                    color: Colors.black,
                                  ).copyWith(fontSize: 14),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.push(AppRoutes.loginScreenRoute);
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: AppTextTheme.bodyMedium(
                                      weight: FontWeight.w600,
                                      color: AppColors.primaryColor,
                                    ).copyWith(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (authProvider.state == AuthState.authenticating) ...[
            const ModalBarrier(
              dismissible: false,
              color: Colors.black26,
            ),
            const Center(child: CircularProgressIndicator()),
          ],
        ],
      ),
    );
  }
}
