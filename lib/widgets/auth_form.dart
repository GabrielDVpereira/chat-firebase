import 'package:chatAppFirebase/models/auth_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final AuthData _authData = AuthData();
  final GlobalKey<FormState> _formKey = GlobalKey();

  _submit() {
    bool isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (!isValid) return;

    print(_authData.email);
    print(_authData.name);
    print(_authData.password);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  if (_authData.isSignUp)
                    TextFormField(
                      key: ValueKey('name'),
                      decoration: InputDecoration(labelText: 'Nome'),
                      initialValue: _authData.name,
                      onChanged: (val) => _authData.name = val,
                      validator: (value) {
                        if (value == null || value.trim().length < 4) {
                          return "Nome deve ter no min 4 caracteres!";
                        }
                        return null;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (val) => _authData.email = val,
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return "Formato de email está incorreto.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Senha'),
                    onChanged: (val) => _authData.password = val,
                    validator: (value) {
                      if (value == null || value.trim().length < 7) {
                        return "Senha deve ter no min 7 caracteres!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    child: Text(_authData.isSignIn ? "Entrar" : "Cadastrar"),
                    onPressed: _submit,
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_authData.isSignIn
                        ? 'Criar uma nova conta?'
                        : "Já possui uma conta?"),
                    onPressed: () {
                      setState(() {
                        _authData.toggleMode();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
