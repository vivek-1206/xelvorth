import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<String> notifications = [
    "Rajgopal your funds will be deposited shortly",
    "Rajgopal your funds will be deposited shortly",
    "Rajgopal your funds will be deposited shortly",
    "Rajgopal your funds will be deposited shortly",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notification",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF463082),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Today"),
            notificationList(),
            Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 15,
                  ),
            const SizedBox(height: 20),
            sectionTitle("Tomorrow"),
            notificationList(),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget notificationList() {
    return Column(
      children: notifications
          .asMap()
          .entries
          .map(
            (entry) => Column(
              children: [
                notificationItem(entry.value),
                if (entry.key != notifications.length - 1)
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 15,
                  ),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget notificationItem(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: Icon(
              Icons.circle,
              size: 6,
              color: Color(0xFF463082),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: "Rajgopal ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 36, 102),
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: "your funds will be deposited shortly",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: "  •  30 secs",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}