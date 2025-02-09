import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widgets/form_register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    double hBody = MediaQuery.of(context).size.height;
    // double wBody = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height: hBody * 0.05),
                  FlutterLogo(size: 100),
                  SizedBox(height: hBody * 0.05),
                  Text(
                    'Let\'s Create An Account',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: hBody * 0.03),
                  FormRegister(
                    formKey: formKey,
                  ),
                  SizedBox(height: hBody * 0.08),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Register Berhasil')));
                          Navigator.pushReplacementNamed(context, '/sign-in');
                        }
                      },
                      child: Text('Sign Up'),
                    ),
                  ),
                  SizedBox(height: hBody * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('or'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: hBody * 0.03),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/image/google.png',
                          fit: BoxFit.contain,
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(width: 10),
                        Text('Sign Up With Google'),
                      ],
                    ),
                  ),
                  SizedBox(height: hBody * 0.03),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, '/sign-in');
                              },
                            text: 'Sign In',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
