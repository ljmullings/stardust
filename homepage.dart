import 'package:flutter/material.dart';

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
                // search bar (might be extraneous)
                print('Search pressed');
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                // open notifs menu
                print('Notifications pressed');
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
                  'Why Astrology?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Example color
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  // Constrain the width of the text block
                  width: MediaQuery.of(context).size.width * 0.7, // 80% of screen width
                  child: Text(
                    'Astrology offers a unique and captivating avenue for personal exploration, life organization, and mindfulness. In a world bustling with activity and often overwhelmed by the mundane, astrology serves as a tool to pause and reflect on the deeper aspects of our lives and personalities. By considering the positions of celestial bodies at the time of our birth, astrology provides insights into our character traits, strengths, weaknesses, and potential life paths. This cosmic perspective encourages individuals to align their actions with their core selves, fostering a sense of harmony and purpose. The practice of charting and anticipating life\'s events according to astrological signs and movements promotes a mindful approach to daily living. It\'s not just about predicting the future, but about understanding the intricate dance of character and destiny. For many, astrology is a fun, intriguing, and insightful way to bring order to chaos, find direction in uncertainty, and cultivate a more mindful, self-aware existence.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,  // Adjust the color as needed
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
  void _showButtonMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox;

    // Calculate the position for the menu
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(overlay.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    ).shift(Offset(-button.size.width, button.size.height));

    final selected = await showMenu<String>(
      context: context,
      position: position,
      items: [
        const PopupMenuItem<String>(value: 'login', child: Text('Login')),
        const PopupMenuItem<String>(value: 'create_account', child: Text('Create Account')),
        const PopupMenuItem<String>(value: 'demo', child: Text('Demo')),
      ],
    );
  }
}
