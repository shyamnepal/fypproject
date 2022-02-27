// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hoteldesktopapp/screens/dashboard/dashboardScreen.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({Key? key}) : super(key: key);

  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
                child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        size: 16,
                      ),
                      title: Text('Dashboard'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        size: 16,
                      ),
                      title: Text('Dashboard'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dashboard,
                        size: 16,
                      ),
                      title: Text('Dashboard'),
                    )
                  ],
                ),
              ),
            )),
            Expanded(
              flex: 6,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
