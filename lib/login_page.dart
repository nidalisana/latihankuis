import 'package:flutter/material.dart';
import 'vehicle_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = "";
  String _password = "";

  
  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => VehiclePage(username: _username), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Login", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          backgroundColor: const Color.fromARGB(255, 5, 109, 161),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              _usernameField(),
              SizedBox(height: 20),
              _passwordField(),
              SizedBox(height: 40), 
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      onChanged: (value) {
        _username = value;
      },
      decoration: InputDecoration(
        hintText: 'Masukkan Username',
        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey[600]), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        _password = value;
      },
      decoration: InputDecoration(
        hintText: 'Masukkan Password',
        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.grey[600]), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), 
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_username == "nida" && _password == "123") {
          _navigateToHome(); 
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Gagal!')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
      ),
      child: Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), 
    );
  }
}
