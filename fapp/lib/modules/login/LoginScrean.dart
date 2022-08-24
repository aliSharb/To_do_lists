import 'package:fapp/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var emailcontroller = TextEditingController();

  var passcontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login Bage',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black12,
                    ),
                  ),
                  SizedBox(height: 40),
                  defFormField(
                    controller: emailcontroller,
                    validMassage: 'Email must not be empty',
                    lableText: 'Enter email@',
                    prefix: Icons.email,
                  ),
                  SizedBox(height: 20),
                  defFormField(
                      controller: passcontroller,
                      validMassage: 'password must not be empty',
                      lableText: 'Enter password',
                      prefix: Icons.lock,
                      Suffix:
                          ispassword ? Icons.visibility : Icons.visibility_off,
                      obscureText: ispassword,
                      keyboardType: TextInputType.visiblePassword,
                      suffixpressed: () {
                        setState(() {
                          ispassword = !ispassword;
                        });
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  defButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print(emailcontroller.text);
                          print(passcontroller.text);
                        }
                      },
                      str: 'login'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(emailcontroller.text);
                              print(passcontroller.text);
                            }
                          },
                          child: const Text('Register Now')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
