import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'userpage.dart';
//import 'package:google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(28, 28, 28, 1),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Stardust'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

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
                MaterialPageRoute(builder: (context) => const HomePage()),
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
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () {
              // Add your onPressed code here!
              print('Home pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              // Add your onPressed code here!
              print('Search pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () {
              // Add your onPressed code here!
              print('Notifications pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile',
            onPressed: () {
              // Add your onPressed code here!
              print('Profile pressed');
            },
          ),
        ],
      ),
      body: const SingleChildScrollView( // Allows the content to be scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Header',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'HELLO!?!?!?!!?!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            // Add more text sections or other widgets as needed
          ],
        ),
      ),
    );
  }
}
