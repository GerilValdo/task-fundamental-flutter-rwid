import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.hBody});

  final double hBody;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isHidden = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text('Email'),
              hintText: 'Masukkan Email Anda',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              if (!value.contains('@')) {
                return 'Email tidak valid';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: _passwordController,
            obscureText: isHidden,
            decoration: InputDecoration(
              label: Text('Password'),
              hintText: 'Masukkan Password',
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    icon: Icon(Icons.visibility_off_outlined)),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password tidak boleh kosong';
              }
              if (value.length < 6) {
                return 'Password minimal 6 karakter';
              }
              return null;
            },
          ),
          Container(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Password Lama'),
                          children: [
                            Form(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        label: Text('Password'),
                                        hintText: 'Masukkan Password',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              title: Text('Password Baru'),
                                              children: [
                                                Form(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          decoration:
                                                              InputDecoration(
                                                            label: Text(
                                                                'Password'),
                                                            hintText:
                                                                'Masukkan Password',
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text('Done')),
                                                    )
                                                  ],
                                                )
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text('Next')),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Forgot Password?'))),
          SizedBox(height: widget.hBody * 0.03),
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
                if (!formKey.currentState!.validate()) {
                  return;
                }
                context.read<AuthBloc>().add(LoginEvent(
                    email: _emailController.text,
                    password: _passwordController.text));
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Login Berhasil')));
                Navigator.pushReplacementNamed(context, "/");
              },
              child: Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
