import 'package:flutter/material.dart ';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: const Center(child: Text('Feed'))),
    );
  }
}
