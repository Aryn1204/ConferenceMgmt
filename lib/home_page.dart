import 'package:conference_mgmt/pages/details_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomePage'
        ),
        centerTitle: true,
      ),
      body: DetailsPage(),
    );
  }
}
