import 'package:app_template/screens/login_screen.dart';
import 'package:app_template/screens/widget/login_signUp_widgets/custom_email_textFormField.dart';
import 'package:app_template/screens/widget/login_signUp_widgets/custom_password_textFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'Sign up Screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fNameController = TextEditingController();

  TextEditingController lNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool secure = true;

  GlobalKey<FormState> signUpFormKey = GlobalKey();

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
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
            child: Form(
              key: signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                      label: 'First Name',
                      suffix: Icons.person,
                      controller: fNameController),
                  SizedBox(height: 15),
                  CustomTextFormField(
                    label: 'Last Name',
                    suffix: Icons.person,
                    controller: lNameController,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormField(
                    label: 'User Name',
                    suffix: Icons.supervised_user_circle,
                    controller: usernameController,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormField(
                      label: 'Email',
                      suffix: Icons.email_outlined,
                      controller: emailController),
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
                    onPressed: () {},
                    child: Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an Account",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Text('Login',
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
