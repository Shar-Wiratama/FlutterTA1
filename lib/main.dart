import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/start_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_application_1/utils/common.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
      url: 'https://pcwwzgairkodfjyiztnc.supabase.co',
      anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBjd3d6Z2FpcmtvZGZqeWl6dG5jIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI4NjgzOTUsImV4cCI6MTk5ODQ0NDM5NX0.jAvN7DcZLHIgbZkzY_bu-Ru0uCRhpPorjDpmoOLyV3E',
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App1',
      theme: ThemeData(primarySwatch: Colors.green 
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  User? _user; 
  
  @override
  void initState(){
    _getAuth();
    super.initState();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = client.auth.currentUser;
    });    
    client.auth.onAuthStateChange.listen((event){
      setState((){
        _user = event.session?.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user == null ? const StartPage(): const HomePage(),
    );
  }
}