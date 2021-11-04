import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/ui.dart';
import 'package:untitled/ui/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TEST Provider')),

        body: Consumer<UI>(builder: (context, ui, child) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text('LOGIN'),
                const SizedBox(height: 10),
                loginForm(context),
              ],
            ),
          );
        })
    );
  }
}
