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

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = false;
  bool _rememberMe = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final success = await context.read<AuthProvider>().login(
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          //Top Background Image
          Image.asset(
            AppImages.auth_bg_wood,
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          SafeArea(
            child: Column(
              children: [
                //Spacer for top area to let background show
                SizedBox(height: MediaQuery.of(context).size.height * 0.20),

                //Main Bottom Content Container
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
                                  "Login",
                                  style: AppTextTheme.h4(
                                    weight: FontWeight.bold,
                                  ),
                                ).pOnly(left: 6),
                                8.heightBox,
                                Text(
                                  'Please enter your email and password to access your account.',
                                  style: AppTextTheme.bodyMedium(
                                    color: AppColors.lightGrey,
                                  ).copyWith(fontSize: 15),
                                ).pOnly(left: 6),
                              ],
                            ),
                            20.heightBox,
                            PrimaryTextField(
                              controller: _emailController,
                              labelText: "Email",
                              prefixIcon: const Icon(Icons.email),
                              validator: Validators.validateEmail,
                            ),
                            12.heightBox,
                            PrimaryTextField(
                              controller: _passwordController,
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
                                        padding: const EdgeInsets.all(2.0),
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
                            // Remember Me row
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 4),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Checkbox(
                                      value: _rememberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value ?? false;
                                        });
                                      },
                                      activeColor: AppColors.primaryColor,
                                      checkColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      side: BorderSide(
                                        color: AppColors.lightGrey,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _rememberMe = !_rememberMe;
                                      });
                                    },
                                    child: Text(
                                      "Remember me",
                                      style: AppTextTheme.bodySmall(
                                        color: AppColors.darkGrey,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      // TODO: Forgot password navigation
                                    },
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size.zero,
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      "Forgot Password?",
                                      style: AppTextTheme.bodySmall(
                                        color: AppColors.primaryColor,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            20.heightBox,
                            PrimaryButton(
                              text: authProvider.state == AuthState.authenticating
                                  ? 'Please wait...'
                                  : 'Login',
                              onTap: _submit,
                              isDisabled: authProvider.state == AuthState.authenticating,
                            ),
                            6.heightBox,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account? ",
                                  style: AppTextTheme.bodyMedium(
                                    color: Colors.black,
                                    weight: FontWeight.w500,
                                  ).copyWith(fontSize: 14),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.push(AppRoutes.signUpScreenRoute);
                                  },
                                  child: Text(
                                    'Create Account',
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
