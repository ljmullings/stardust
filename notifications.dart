import 'package:flutter/material.dart';
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(100.0),
            1: FlexColumnWidth(),
          },
          border: TableBorder.all(color: Colors.white),
          children: [
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Read', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Message', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Yes', style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Welcome! Learn a little bit more about stardust..', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            // extra rows go here
          ],
        ),
      ),
    );
  }
}
