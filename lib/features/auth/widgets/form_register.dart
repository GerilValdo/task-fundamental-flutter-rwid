import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const FormRegister({
    super.key,
    required this.formKey,
  });

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isHidden = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              label: Text('Name'),
              hintText: 'Masukkan Nama Anda',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              return null;
            },
          ),
          SizedBox(height: 15),
          TextFormField(
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
            keyboardType: TextInputType.visiblePassword,
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
        ],
      ),
    );
  }
}
