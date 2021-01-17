import 'dart:math';

import 'package:chatAppFirebase/models/auth_data.dart';
import 'package:chatAppFirebase/widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _handleSubmit(AuthData authData) async {
    try {
      if (authData.isSignIn) {
        await _auth.signInWithEmailAndPassword(
          email: authData.email.trim(),
          password: authData.password,
        );
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: authData.email.trim(),
          password: authData.password,
        );
      }
    } catch (err) {
      print("ERRR");
      final msg = err.message ?? "Ocorreu um erro com suas credenciais";
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_handleSubmit),
    );
  }
}
