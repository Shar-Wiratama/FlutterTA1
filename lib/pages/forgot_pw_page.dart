import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    final email = _emailController.text.trim();

    // Memulihkan kata sandi melalui Supabase
    final response = await supabase.auth.resetPasswordForEmail(email);

    if (response.error != null) {
      // Gagal memulihkan kata sandi
      Fluttertoast.showToast(
        msg: response.error!.message!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      // Kata sandi berhasil direset, tampilkan pesan sukses
      Fluttertoast.showToast(
        msg: 'Email pemulihan telah dikirim.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );

      // Navigasi ke halaman login setelah reset kata sandi
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [

          const SizedBox(height: 25),

          ///Email
            MyTextField(
              controller: _emailController,
              hintText: 'Masukkan Email',                               
              obscureText: false,
            ),

            const SizedBox(height: 25),

           ///SFogot Pass Button
            MaterialButton(
                onPressed: passwordReset(),
                child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            "Send Message",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
              ),
    
        ],
      ),
    );
  }
}