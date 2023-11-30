import 'package:bookingin/colors.dart';
import 'package:bookingin/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool seePassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    "images/logo_bookingin.png",
                    width: MediaQuery.of(context).size.width/2,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Username"),
                  onChanged: (value) {
                    userCtrl.text = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please fill the username";
                    } else {
                      return null;
                    }
                  },
                ),
                TextFormField(
                  onChanged: (value) {
                    passCtrl.text = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please fill the password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            debugPrint("Yud $seePassword");
                            setState(() {
                              seePassword = !seePassword;
                            });
                          },
                          icon: Icon(seePassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.lock))),
                  obscureText: seePassword ? false : true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint(userCtrl.text);
                    debugPrint(passCtrl.text);
                    if (formKey.currentState!.validate()) {
                      if (userCtrl.text == "user" && passCtrl.text == "pass") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Wrong username / password")));
                      }
                    } else {
                      debugPrint("Masih error nih");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorB.gold,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 36)),
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
