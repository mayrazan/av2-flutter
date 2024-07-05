import 'package:flutter/material.dart';
import 'package:imake/routes/pages.dart';
import 'package:imake/tasks/data/repository/token_repository.dart';
import 'package:imake/tasks/data/repository/user_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _repository = UserRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void _saveUser() async {
    if (!_validateFields()) return;

    final email = _emailController.text;
    final password = _passwordController.text;

    final emailExists = await _repository.checkEmailExists(email);
    if (emailExists) {
      _showEmailExistsSnackBar();
      return;
    }

    await _repository.saveUser(email, password);
    await _tokenRepository.saveToken();
    _showSuccessSnackBar();

    if (mounted) {
      Navigator.pushNamed(context, Pages.initial);
    }
  }

  bool _validateFields() {
    final isEmailEmpty = _emailController.text.isEmpty;
    final isPasswordEmpty = _passwordController.text.isEmpty;

    if (isEmailEmpty || isPasswordEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill all fields.'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
      return false;
    }
    return true;
  }

  void _showEmailExistsSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Email already exists.'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('User registered successfully.'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveUser();
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
