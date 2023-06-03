import 'package:app_template/screens/login_screen.dart';
import 'package:app_template/screens/widget/login_signUp_widgets/custom_email_textFormField.dart';
import 'package:app_template/screens/widget/login_signUp_widgets/custom_password_textFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/app_provider.dart';

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
  bool selected = true;

  GlobalKey<FormState> signUpFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Image.asset(
          'assets/images/SIGN IN.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                selected = !selected;
                pro.changeLanguage(selected ? 'en' : 'ar');
              },
              icon: Icon(Icons.language),
            ),
          ),
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
                      label: AppLocalizations.of(context)!.fName,
                      suffix: Icons.person,
                      controller: fNameController),
                  SizedBox(height: 15),
                  CustomTextFormField(
                    label: AppLocalizations.of(context)!.lName,
                    suffix: Icons.person,
                    controller: lNameController,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormField(
                    label: AppLocalizations.of(context)!.userNameEmail,
                    suffix: Icons.supervised_user_circle,
                    controller: usernameController,
                  ),
                  SizedBox(height: 15),
                  CustomTextFormField(
                      label: AppLocalizations.of(context)!.email,
                      suffix: Icons.email_outlined,
                      controller: emailController),
                  SizedBox(height: 15),
                  CustomPasswordTextFormField(
                    label: AppLocalizations.of(context)!.password,
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
                      AppLocalizations.of(context)!.signUp,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.haveAccount,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Text(AppLocalizations.of(context)!.login,
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
