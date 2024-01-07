import 'package:flutter/material.dart';
import 'Registrasi.dart';
import 'MainAfterLogin.dart';
import 'home_screen.dart'; // Import MainScreen.dart

class LoginPage extends StatefulWidget {
  final String registeredEmail;
  final String registeredPassword;
  final String registeredFirstName; // Tambahkan properti ini

  LoginPage({
    required this.registeredEmail,
    required this.registeredPassword,
    required this.registeredFirstName,
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoginFailed = false;
  bool _isInputEmpty = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Login'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Kembali ke halaman MainScreen.dart menggunakan pushReplacement
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Anda perlu login :)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
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
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lakukan logika login di sini
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // Validasi apakah email dan password tidak kosong
                  if (email.isEmpty || password.isEmpty) {
                    setState(() {
                      _isInputEmpty = true;
                      _isLoginFailed = false;
                    });
                  } else {
                    // Periksa apakah email dan password sesuai dengan data registrasi
                    if (email == widget.registeredEmail &&
                        password == widget.registeredPassword) {
                      // Jika sesuai, pindah ke halaman setelah login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainAfterLogin(
                            registeredFirstName: widget.registeredFirstName,
                          ),
                        ),
                      );
                    } else {
                      // Jika tidak sesuai, tampilkan notifikasi
                      setState(() {
                        _isLoginFailed = true;
                        _isInputEmpty = false;
                      });
                    }
                  }
                },
                child: Text('Login'),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Navigate to registration page when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registrasi()),
                  );
                },
                child: Text('Belum punya akun? Daftar di sini'),
              ),
              if (_isInputEmpty)
                Text(
                  'Email dan password harus diisi.',
                  style: TextStyle(color: Colors.red),
                ),
              if (_isLoginFailed)
                Text(
                  'Login gagal. Periksa kembali email dan password Anda.',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
