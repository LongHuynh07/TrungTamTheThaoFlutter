
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdatingCourtsPage extends StatefulWidget {
  const UpdatingCourtsPage({super.key});

  @override
  State<UpdatingCourtsPage> createState() => UpdatingCourtsPageState();
}

class UpdatingCourtsPageState extends State<UpdatingCourtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Courts')),
      body: const Center(child: Text('List of all courts')),
    );
  }
}
