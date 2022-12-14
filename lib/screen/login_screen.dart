import 'package:flutter/material.dart';
import 'package:catatan/services/firebase_auth_services.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuthServices fbServices = FirebaseAuthServices();

  login() async {
    fbServices
        .loginAkun(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${value.user?.email} succes login'),
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
            const Text('login'),
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
                  login();
                },
                child: const Text('Login')),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text('belum punya akun? daftar dsini'),
            ),
          ],
        ),
      ),
    );
  }
}
