import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateEmail,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Passwort"),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validatePw,
                obscureText: true, // за да скрием паролата при въвеждане
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    print("Form is valid");
                  } else {
                    print("Form is not valid");
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return 'Email darf nicht leer sein.';
    } else if (input.length <= 5) {
      return 'Email muss mehr als 5 Zeichen haben.';
    } else if (!input.contains('@')) {
      return 'Email muss das Zeichen “@” enthalten.';
    } else if (!(input.endsWith('.com') || input.endsWith('.de'))) {
      return 'Email muss mit “.com” oder “.de” enden.';
    }
    return null;
  }

  String? validatePw(String? input) {
    if (input == null || input.isEmpty) {
      return 'Passwort darf nicht leer sein.';
    } else if (input.length < 6 || input.length > 12) {
      return 'Passwort muss zwischen 6 und 12 Zeichen lang sein.';
    }
    return null;
  }
}
