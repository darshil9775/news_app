import 'package:flutter/material.dart';
import 'package:news_app/fourth_scr.dart';
import 'package:news_app/second.dart';
import 'package:sizer/sizer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  void _navigateToForgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OTPVerificationScreen()),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo Placeholder
            Image.asset("asset/images/newsss.png", height: 10.h),
            SizedBox(height: 9.h),

            // Username Input
            TextField(
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.w),
                ),
              ),
            ),
            SizedBox(height: 2.h),

            // Email Input
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.w),
                ),
              ),
            ),
            SizedBox(height: 2.h),

            // Password Input with Eye Icon
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.w),
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: 1.h),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => _navigateToForgotPassword(context),
                child: Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 12.sp, color: Colors.blue),
                ),
              ),
            ),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () => (context),
                child: const Text("Sign In",style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 2.h),

            // OR Divider
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Text("or sign in with", style: TextStyle(fontSize: 12.sp)),
                ),
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 2.h),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialButton(Icons.g_mobiledata),
                _socialButton(Icons.facebook),
                _socialButton(Icons.shopping_basket_rounded),
                _socialButton(Icons.apple),
              ],
            ),
            SizedBox(height: 2.h),

            // Register Text
            GestureDetector(
              onTap: () => _navigateToRegister(context),
              child: Text(
                "Don’t have an account? Register",
                style: TextStyle(fontSize: 12.sp, color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: IconButton(
        icon: Icon(icon, size: 6.w, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}

// Forgot Password Screen
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: const Center(child: Text("Reset your password here")),
    );
  }
}

// Sign Up Screen
// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Welcome to NewsWatch!")),
    );
  }
}