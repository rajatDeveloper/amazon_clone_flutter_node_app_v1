import 'package:amazon_clone_nodejs/common/widgets/custom_button.dart';
import 'package:amazon_clone_nodejs/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);
  static const String routeName = '/auth-screen';
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final AuthService authService = AuthService();
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    print(_emailController.text +
        " " +
        _passwordController.text +
        " " +
        _nameController.text);
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      // appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor:
                  _auth == Auth.signup ? GlobalVariables.backgroundColor : null,
              title: Text(
                "Create Account ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
                groupValue: _auth,
                value: Auth.signup,
                activeColor: GlobalVariables.secondaryColor,
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _nameController, hintText: "Enter Name"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _emailController,
                          hintText: "Enter Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _passwordController,
                          hintText: "Enter Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Sign Up",
                          onTap: () {
                            if (_signupFormKey.currentState!.validate()) {
                              signUpUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor:
                  _auth == Auth.signin ? GlobalVariables.backgroundColor : null,
              title: Text(
                "Sign-In  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
                groupValue: _auth,
                value: Auth.signin,
                activeColor: GlobalVariables.secondaryColor,
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                color: GlobalVariables.backgroundColor,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Form(
                  key: _signinFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _emailController,
                          hintText: "Enter Email"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _passwordController,
                          hintText: "Enter Password"),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Sign In",
                          onTap: () {
                            if (_signinFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          })
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
