import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myodaapp/viewmodel/login_viewmodel.dart';
import 'package:myodaapp/view/login_dialogue.dart';
import 'package:myodaapp/view/bottomnavbar.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  String? _email;
  String? _password;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username/email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  Future<void> _attemptLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();
      final loginVM = Provider.of<LoginViewModel>(context, listen: false);
      final isValidPassword = loginVM.validatePasswordRules(_password!);

      if (!isValidPassword) {
        showDialog(
          context: context,
          builder: (context) => const LoginDialogue(),
        );
        return;
      }

      final result = await loginVM.login(_email!, _password!);

      if (result == 'success') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NavBar()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => const LoginDialogue(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginVM = Provider.of<LoginViewModel>(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    // Green background image with rounded bottom
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Image.asset(
                        'assets/images/bg.png',
                        fit: BoxFit.cover,
                        height: constraints.maxHeight * 0.35,
                        width: double.infinity,
                      ),
                    ),

                    // Centered logo overlapping green and white
                    Positioned(
                      top: constraints.maxHeight * 0.23,
                      left: (constraints.maxWidth / 2) - 75, // Assuming logo is 150 width
                      child: Image.asset(
                        'assets/images/onboard1.png', // Replace with your actual logo
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Main content pushed down below logo
                    Padding(
                      padding: EdgeInsets.only(top: constraints.maxHeight * 0.47),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome back!',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    style: const TextStyle(fontFamily: 'Poppins'),
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person_outline),
                                      hintText: 'Username/Email',
                                      hintStyle: TextStyle(fontFamily: 'Poppins'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                      ),
                                    ),
                                    validator: validateEmail,
                                    onSaved: (value) => _email = value,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    obscureText: !_isPasswordVisible,
                                    style: const TextStyle(fontFamily: 'Poppins'),
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.lock_outline),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(fontFamily: 'Poppins'),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible = !_isPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: validatePassword,
                                    onSaved: (value) => _password = value,
                                  ),
                                  const SizedBox(height: 30),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: loginVM.isLoading ? null : _attemptLogin,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF18B3BD),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: loginVM.isLoading
                                          ? const CircularProgressIndicator(color: Colors.white)
                                          : const Text(
                                              'Sign In',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Version 1.0.0',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const Text(
                                    'Powered by Srdn.Co',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Handle help & support
                                    },
                                    child: const Text(
                                      'Help & Support',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.blue,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                ],
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
        },
      ),
    );
  }
}
