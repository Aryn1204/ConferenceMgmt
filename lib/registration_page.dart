import 'package:conference_mgmt/home_page.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conference Management System'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Register',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 60.0,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Enter Username',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: Colors.blueAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: Colors.blueAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: Colors.blueAccent), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 45.0,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
