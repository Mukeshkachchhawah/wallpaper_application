import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your privacy is important to us. This document explains our data collection and usage practices. By using our app, you consent to the practices described in this policy.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'This privacy policy governs your use of the software application Wallpapers - for Android (“Application”) for mobile devices provided by Livintis W.L.L. The Application is a wallpaper application that allows the user to browse and save wallpapers to their mobile device to use as lock screen and home screen wallpapers.',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 16.0),
            Text(
              'What information does the Application obtain?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Automatically Collected Information: the Application may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile devices unique device ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browsers you use, and information about the way you use the Application. We also collect behavioral application event data for analytics: access dates and times, app features or pages viewed, app crashes and other system activity and information.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              "User Provided Data: we collect content submitted by users to us, such as bug reports, customer support communications. transaction-related information, such as when you make purchases, respond to any offers, or download or use applications from us; information you provide us when you contact us for help; and information you provide when you register and create an account. Registration with us is optional. However, please keep in mind that you may not be able to use some of the features offered by the Application unless you register with us. When you optionally register with the Application, you provide email address and password.",
              style: TextStyle(fontSize: 16),
            ),
            // Add more sections with relevant content about your privacy policy.
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to navigate to the main app screen after accepting the policy.
              },
              child: Text('I Accept'),
            ),
          ],
        ),
      ),
    );
  }
}
