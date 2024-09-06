import 'package:code_tutoorial/5/bucket_list_with_firebase/lib/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, authService, child) {
      
      return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Center(
              child: Text(
                "Plase Login",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 32),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter Email",
                )),
            TextField(
                controller: passwordController,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                )),
            const SizedBox(height: 32),
            ElevatedButton(
                onPressed: () {
                  authService.login(
                    email: emailController.text,
                    password: passwordController.text,
                    onSuccess: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login Success"),
                        ),
                      );
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    onError: (err) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(err),
                        ),
                      );
                    },
                  );
                },
                child: const Text("Login")),
            ElevatedButton(
              onPressed: () {
                authService.signUp(
                  email: emailController.text,
                  password: passwordController.text,
                  onSuccess: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Member created"),
                      ),
                    );
                  },
                  onError: (err) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(err),
                      ),
                    );
                  },
                );
              },
              child: const Text("Sign up"),
            ),
          ]),
        ),
      );
    });
  }
}
