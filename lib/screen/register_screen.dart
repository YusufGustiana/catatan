import 'package:flutter/material.dart';

import '../services/firebase_auth_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthServices fbServices = FirebaseAuthServices();

  register() async {
    fbServices
        .registerAkun(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${value?.user?.email} succes register'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text('register'),
            const SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'email',
                hintText: 'masukan email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'masukan password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  register();
                },
                child: const Text('Register ')),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('sudah punya akun? login dsini'),
            ),
          ],
        ),
      ),
    );
  }
}
