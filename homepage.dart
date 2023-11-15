import 'package:flutter/material.dart';
import 'package:stardust/authentication_service.dart';
import 'profilepage.dart';
import 'notifications.dart';

class HomePage extends StatelessWidget {
  final AuthenticationService authService;

  const HomePage({Key? key, required this.authService}) : super(key: key);

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
                print('Home pressed');
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                // open notifs menu
                print('Notifications pressed');
                Navigator.push (
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage(),
                  ),
                );
              },
            ),
            IconButton(
                  icon: const Icon(Icons.account_circle),
                  tooltip: 'Profile',
                  onPressed: () {
                    _showButtonMenu(context);
                    print('Profile pressed');
                    },
              ),
            ],
        ),

        body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'stardust',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                     'from what once was, to what will be',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {

                  Color buttonColor;
                  IconData? buttonIcon;
                  String buttonText;

                  switch (index) {
                    case 0:
                      buttonColor = Colors.deepPurple[200]!;
                      buttonIcon = Icons.star;
                      buttonText = "my stardust";
                      break;
                    case 1:
                      buttonColor = Colors.pink[200]!;
                      buttonIcon = Icons.favorite;
                      buttonText = "habit tracking";
                      break;
                    case 2:
                      buttonColor = Colors.green[200]!;
                      buttonIcon = Icons.nature_people;
                      buttonText = "see horoscope";
                      break;
                    case 3:
                      buttonColor = Colors.blue[200]!;
                      buttonIcon = Icons.water;
                      buttonText = "my goals";
                      break;
                    default:
                      buttonColor = Colors.grey;
                      buttonText = "Button ${index + 1}";
                  }

                  return AspectRatio(
                    aspectRatio: 1.0,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print("Button $index pressed");
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyProfilePage(),), //userName: authService.currentUser?.displayName)
                            );
                          }
                          // Additional actions
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (buttonIcon != null) Icon(buttonIcon, size: 40),
                            Text(buttonText),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: buttonColor,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        )
    );
  }
  void _showButtonMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context)!.context
        .findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(
            overlay.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    ).shift(Offset(-button.size.width, button.size.height));

    final selected = await showMenu<String>(
      context: context,
      position: position,
      items: [
        const PopupMenuItem<String>(value: 'login', child: Text('Login')),
        const PopupMenuItem<String>(
            value: 'create_account', child: Text('Create Account')),
        const PopupMenuItem<String>(value: 'demo', child: Text('Demo')),
      ],
    );

    if (selected == 'login') {
      signInWithGoogleAction(context);
    }
  }
  void signInWithGoogleAction(BuildContext context) async {
    try {
      final user = await authService.signInWithGoogle();
      if (user != null) {
        // User successfully signed in
        // Navigate to another screen or update the UI accordingly
        print('User signed in: ${user.displayName}');
      } else {
        // User cancelled the sign-in process
        print('Sign-in cancelled');
      }
    } catch (e) {
      print('Error during sign-in: $e');

    }
  }
}
