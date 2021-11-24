import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  const FormTestRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form demo'),
        ),
        body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      labelText: "username",
                      hintText: "username or email",
                      icon: Icon(Icons.person)),
                  validator: (username) {
                    return username!.trim().isNotEmpty
                        ? null
                        : "username cannot empty";
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: "password",
                      hintText: "please input your password",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: (pwd) {
                    return pwd!.trim().length >= 6
                        ? null
                        : "password digit cannot less than 6!";
                  },
                ),
                // login button
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            print("Loing success");
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Login"),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            )));
  }
}
