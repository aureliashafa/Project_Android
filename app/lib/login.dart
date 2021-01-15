import 'package:app/home.dart';
import 'package:app/util/navigator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  FocusNode _emailFn = FocusNode();
  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return emailValid;
  }

  TextEditingController _password = TextEditingController();
  FocusNode _passwordFn = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbeb3eb),
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 21.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Silahkah Login Terlebih Dahulu",
                style: TextStyle(
                  fontSize: 15.5,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, bottom: 0, left: 50, right: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        focusNode: _emailFn,
                        decoration: InputDecoration(
                          hintText: ("Email"),
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                        ),
                        validator: (value) =>
                            isEmailValid(value) ? null : 'Email masih kosong',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _password,
                        focusNode: _passwordFn,
                        decoration: InputDecoration(
                          hintText: ("Password"),
                          prefixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'Password Masih Kosong' : null,
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: RaisedButton(
                          onPressed: () {
                            if (_key.currentState.validate()) {
                              pushRemoveUntil(context, Home());
                            }
                          },
                          color: Color(0xFFbeb3eb),
                          child: Text("Login"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
