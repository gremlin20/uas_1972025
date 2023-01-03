import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.go("/login");
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Register Page',
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          //EMAIL TEXT
          Container(
            margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              controller: emailController,
              cursorColor: Colors.orange,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Email'),
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: passwordController,
                cursorColor: Colors.orange,
                obscureText: true,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Password'),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            //* SIGN UP BUTTON
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange.shade900)),
                  onPressed: () async {
                    // CODE HERE: Sign up with email & password / Sign out from firebase
                    if (FirebaseAuth.instance.currentUser == null) {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                      context.goNamed('main');
                    } else {
                      await FirebaseAuth.instance.signOut();
                    }
                  },
                  child: StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.userChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return const Text('Sign Out');
                      } else {
                        return const Text("Sign Up");
                      }
                    },
                  )),
            )
          ]),
        ])));
  }
}
