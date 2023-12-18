// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, top: 30, right: 15, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/shoeHub.png',
            ),
            const SizedBox(height: 50),
            const Text(
              'Welcome to Our Company',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are a team of passionate individuals dedicated to providing high-quality products and services to our customers.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: ShoeHub@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              'Phone: +918073056045,+919980775499',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
