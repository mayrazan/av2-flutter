import 'package:flutter/material.dart';
import 'package:imake/routes/pages.dart';
import 'package:imake/tasks/data/repository/token_repository.dart';
import 'package:imake/tasks/data/repository/user_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserRepository _repository = UserRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (!_validateFields()) return;

    final email = _emailController.text;
    final password = _passwordController.text;

    final user = await _repository.getUser();
    if (user == null) {
      _showUserNotFoundSnackBar();
      return;
    }

    if (user.email != email || user.password != password) {
      _showInvalidCredentialsSnackBar();
      return;
    }

    _showSuccessSnackBar();
    await _tokenRepository.saveToken();
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

  void _showUserNotFoundSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('User not found.'),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ),
    );
  }

  void _showInvalidCredentialsSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Invalid credentials.'),
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
        content: const Text('Login successful.'),
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
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _login();
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the registration page
                Navigator.pushNamed(context, Pages.register);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
