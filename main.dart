import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_options.dart';
import 'screens/homepage.dart';
import 'authentication_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
//import 'package:google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? googleClientId;
  if (kIsWeb) {
    googleClientId = "<SOMETHINGGOESHERE>"; // a magician never shares his secrets
  }

  AuthenticationService authService = AuthenticationService(FirebaseAuth.instance, clientId: googleClientId);
  runApp(MyApp(authService: authService));
}

class MyApp extends StatelessWidget {
  final AuthenticationService authService;

  const MyApp({Key? key, required this.authService}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stardust Astrology',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Stardust', authService: authService),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final AuthenticationService authService;
  final String title;

  MyHomePage({Key? key, required this.authService, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(authService: widget.authService)),
              );
            },
            child: const SizedBox(
              height: 200, width: 200,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white70,
                valueColor: AlwaysStoppedAnimation(Colors.transparent),
              ),
            ),
          ),

          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Stardust",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Parisienne',
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "aligned with the stars",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Parisienne',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
