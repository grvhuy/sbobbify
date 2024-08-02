import 'package:flutter/material.dart';
import 'package:sbobbify/components/my_button.dart';
import 'package:sbobbify/components/my_text_field.dart';

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  void Function()? onTap;
  RegisterPage({super.key, required this.onTap});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          const Icon(
            Icons.food_bank_sharp,
            size: 72,
          ),
          // message, slogan
          Text(
            "the fastest delivery service alive",
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(
            height: 15,
          ),
          //  email
          MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false),
          const SizedBox(height: 15),
          // password
          MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true),
          const SizedBox(
            height: 15,
          ),

          MyTextField(controller: confirmPasswordController, hintText: "Confirm password", obscureText: true),
          const SizedBox(
            height: 15,
          ),
          // sign in button
          MyButton(text: "Sign Up", onTap: () {}),
          // register now
          const SizedBox(
            height: 15,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
