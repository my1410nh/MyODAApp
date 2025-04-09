import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(0, 92, 252, 1), // Background color
        body: Stack(
          children: <Widget>[
            // VNPT logo background
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/vnptlogo.png'),
                  alignment: Alignment.topLeft, // Positioning the logo top-left
                ),
              ),
            ),

            // Logo and Title
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 60), // Adjust padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Logo
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

                    // Title
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

            // The container for the login form with rounded corners
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 660, // Adjust the height of the container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 30.0, right: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, 
                    crossAxisAlignment: CrossAxisAlignment.center, 
                    children: <Widget>[
                      // Title "ĐĂNG NHẬP"
                      Text(
                        'ĐĂNG NHẬP',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 30), 

                      // Username TextField
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Tên đăng nhập',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Password TextField
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Mật khẩu',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility_off, color: Colors.grey),
                            onPressed: () {
                              // Handle password visibility toggle
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 40),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(1, 118, 255, 1), 
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
                      SizedBox(height: 40),

                      // Fingerprint
                      GestureDetector(
                        onTap: () {
                          // Handle fingerprint authentication
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
            )

          ],
        ),
      ),
    );
  }
}
