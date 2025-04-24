import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myodaapp/viewmodel/login_viewmodel.dart';
import 'package:myodaapp/view/nav/bottomnavbar.dart';
import 'package:myodaapp/view/auth/login_dialogue.dart'; 

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

  // Email validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  // Password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    }
    return null; 
  }

  void _attemptLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState!.save();

      final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$');
      if (!passwordRegex.hasMatch(_password ?? '')) {
        showDialog(
          context: context,
          builder: (context) => const LoginDialogue(),
        );
        return;
      }

      bool loginSuccessful = await Provider.of<LoginViewModel>(context, listen: false)
          .login(_email!, _password!);  // Call ViewModel's login function

      if (loginSuccessful) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const NavBar()), // Navigate after login
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(0, 92, 252, 1),
        body: Stack(
          children: <Widget>[
            // VNPT logo 
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vnptlogo.png'),
                  alignment: Alignment.topLeft, 
                ),
              ),
            ),

            // Logo and Title
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/images/elipse1.png',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'HỆ THỐNG THÔNG TIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'QUẢN LÝ TÀI CHÍNH VNPT',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container for form
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 660, 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Title 
                        Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 30),

                        // Email Field
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Tên đăng nhập',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEmail,
                            onSaved: (value) => _email = value,
                          ),
                        ),

                        // Password Field
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextFormField(
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              labelText: 'Mật khẩu',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey,
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
                        ),

                        SizedBox(height: 40),

                        // Login Button 
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _attemptLogin, // Trigger login
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(1, 118, 255, 1),
                              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),

                        // Fingerprint Gesture
                        GestureDetector(
                          onTap: () {
                          },
                          child: Icon(
                            Icons.fingerprint,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Copyright Text
            Positioned(
              bottom: 25,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Copyright 2020 VNPT IT',
                  style: TextStyle(
                    color: Color.fromRGBO(119, 140, 162, 1),
                    fontSize: 12,
                    fontFamily: 'SF Pro Text',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
