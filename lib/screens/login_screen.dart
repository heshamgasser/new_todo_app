import 'package:app_template/home_layout/home_layout.dart';
import 'package:app_template/screens/signUp_screen.dart';
import 'package:app_template/screens/widget/login_signUp_widgets/custom_email_textFormField.dart';
import 'package:app_template/screens/widget/login_signUp_widgets/custom_password_textFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool secure = true;

  GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/SIGN IN.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            child: Form(
              key: loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    label: 'User Name or Email',
                    suffix: Icons.email_outlined,
                    controller: emailController,
                  ),
                  SizedBox(height: 15),
                  CustomPasswordTextFormField(
                    label: 'Password',
                    controller: passwordController,
                    obscure: secure,
                    onTapped: () {
                      secure = !secure;
                    },
                    iconData:
                        secure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have an Account",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpScreen.routeName);
                        },
                        child: Text('Sign Up',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
