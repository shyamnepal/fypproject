// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hoteldesktopapp/screens/HotelInfo.dart';
import 'package:hoteldesktopapp/screens/dashboard/admindashboard.dart';
import 'package:hoteldesktopapp/screens/roomInfo.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminDashBoard()));
          },
          leading: Icon(
            Icons.dashboard,
            size: 16,
          ),
          title: Text('Dashboard'),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HotelInfo()));
          },
          leading: Icon(
            Icons.dashboard,
            size: 16,
          ),
          title: Text('Add HotelInfo'),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => RoomInfo()));
          },
          leading: Icon(
            Icons.dashboard,
            size: 16,
          ),
          title: Text('Add RoomInfo'),
        )
      ],
    ));
  }
}
