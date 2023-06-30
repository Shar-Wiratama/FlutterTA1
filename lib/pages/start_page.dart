import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';

import 'forgot_pw_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  //bool _signInLoading = false ;
  //bool _signUpLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey =  GlobalKey<FormState>();

  void signUserIn() {}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Center(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),

            ///Login Text
            const Center(
            child: Text(
              'Login',
            style: TextStyle(
                color: Colors.green,
                fontSize: 40,
              ),
            ),
        ),
            
            const SizedBox(height: 25),
           
            ///Email
            MyTextField(
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please fill email address!';
              //   }
              //   return null;
              // },
              controller: _emailController,
              hintText: 'Email',                               
              obscureText: false,
            ),
            
            const SizedBox(height: 10),

            ///Password
            MyTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: 
                          (context){
                            return ForgotPasswordPage();
                            },
                          ),
                        );
                      },
                      child:
                      Text(
                        'Forgot Password',
                        style: TextStyle(
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 25,),

            ///Sign In Button
            MyButton(
                onTap: signUserIn,
              ),
          ],
        ), 
      ),
    ),
    );
  }
}