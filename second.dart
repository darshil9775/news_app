import 'package:flutter/material.dart';
import 'package:news_app/third_scr.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool? userType; // true for Media Reporter, false for Visitor

  void _signUp(BuildContext context) {
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        userType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields and select a user type")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _navigateToSignIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()), //  Navigate to SignInScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset("asset/images/newsss.png", height: 80),
              const SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text("Media Reporter"),
                      leading: Radio<bool>(
                        value: true,
                        groupValue: userType,
                        onChanged: (val) {
                          setState(() {
                            userType = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text("Visitor"),
                      leading: Radio<bool>(
                        value: false,
                        groupValue: userType,
                        onChanged: (val) {
                          setState(() {
                            userType = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () => _signUp(context),
                  child: const Text("Sign Up",style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(height: 20),
              const Text("or sign in with"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: const Icon(Icons.mail, size: 40), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.g_mobiledata, size: 45), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.facebook, size: 40), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.shopping_basket_rounded, size: 40), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.apple, size: 45), onPressed: () {}),
                ],
              ),
              const SizedBox(height: 20),

              // Added "Sign In" Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => _navigateToSignIn(context),
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "By signing up to News24 you are accepting our Terms & Conditions",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  New Sign In Screen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: const Center(
        child: Text("Welcome to NewsWatch!", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
