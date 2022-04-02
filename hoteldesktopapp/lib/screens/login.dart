// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hoteldesktopapp/screens/dashboard/admindashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xff120de),
                Color(0xffa1c4fd),
                Color(0xffc2e9fb),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome ',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login to Your Account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            suffixIcon: Icon(Icons.person)),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.remove_red_eye)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget Password',
                                style: TextStyle(color: Color(0xfff4d0f4)),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminDashBoard()));
                        },
                        child: const Text('login'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xfff4d0f4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
