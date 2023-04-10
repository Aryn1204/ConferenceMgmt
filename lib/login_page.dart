import 'package:conference_mgmt/home_page.dart';
import 'package:conference_mgmt/pages/expert_page.dart';
import 'package:conference_mgmt/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late String username;
  late String password;
  int currentPager=0;



  @override
  Widget build(BuildContext context) {

    Future signIn() async{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameController.text, password: passwordController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }

    logIn() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: usernameController.text, password: passwordController.text);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }

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
              'Login',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Student', 'Expert'],
                onToggle: (index) {
                  currentPager=index!;
                },
              ),
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
            SizedBox(
              height: 45.0,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: (){
                  if(usernameController.text!="" && passwordController.text!=""){
                    if(currentPager==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ExpertPage()));
                    }
                  }
                  else{
                   print('No username written');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: const Text('Login'),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(children: const [
              Expanded(child: Divider()),
              Text("OR"),
              Expanded(child: Divider()),
            ]),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New User?'),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
