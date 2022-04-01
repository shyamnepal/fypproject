// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hoteldesktopapp/components/side_menu.dart';
import 'package:hoteldesktopapp/constant/responsive.dart';
import 'package:hoteldesktopapp/module/hotelinfo.dart';
import 'package:hoteldesktopapp/module/roomInfo.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class HotelInfo extends StatefulWidget {
  @override
  _HotelInfoState createState() => _HotelInfoState();
}

class _HotelInfoState extends State<HotelInfo> {
  TextEditingController _hotelName = TextEditingController();

  TextEditingController _ZipCode = TextEditingController();

  TextEditingController _city = TextEditingController();

  TextEditingController _state = TextEditingController();

  TextEditingController _hotelLocation = TextEditingController();

  TextEditingController _room_type = TextEditingController();

  TextEditingController _room_price = TextEditingController();

  TextEditingController _number_of_beds = TextEditingController();
  TextEditingController _hotelID = TextEditingController();

  TextEditingController _roomImage = TextEditingController();

  Uint8List? imagevalue;
  String? imagename;

  TextEditingController _edithotelName = TextEditingController();

  TextEditingController _editZipCode = TextEditingController();

  TextEditingController _editcity = TextEditingController();

  TextEditingController _editstate = TextEditingController();

  TextEditingController _edithotelLocation = TextEditingController();

  Future featchHotelInfo() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/hotel-details/'));

    if (response.statusCode == 200) {
      final ConvertDataJSON = json.decode(response.body);
      print(ConvertDataJSON);
      return ConvertDataJSON;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    featchHotelInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: SlideMenu()),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          // ignore: prefer_const_constructors
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      height: 550,
                                      width: 400,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              'please uplaod the hotel information',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 10),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                color: Colors.white,
                                              ),
                                              child: TextField(
                                                controller: _hotelName,
                                                decoration: InputDecoration(
                                                    hintText: 'hotel name',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                    suffixIcon:
                                                        Icon(Icons.close),
                                                    suffixStyle: TextStyle(
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                    focusColor: Colors.black,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15)))),
                                              ),
                                            ),
                                          ),

                                          //zipcode textfeild
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 10),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                color: Colors.white,
                                              ),
                                              child: TextField(
                                                controller: _ZipCode,
                                                decoration: InputDecoration(
                                                    hintText: 'zip Code',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                    suffixIcon:
                                                        Icon(Icons.close),
                                                    suffixStyle: TextStyle(
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                    focusColor: Colors.black,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15)))),
                                              ),
                                            ),
                                          ),

                                          //city
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 10),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                color: Colors.white,
                                              ),
                                              child: TextField(
                                                controller: _city,
                                                decoration: InputDecoration(
                                                    hintText: 'City',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                    suffixIcon:
                                                        Icon(Icons.close),
                                                    suffixStyle: TextStyle(
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                    focusColor: Colors.black,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15)))),
                                              ),
                                            ),
                                          ),

                                          //state
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 10),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                color: Colors.white,
                                              ),
                                              child: TextField(
                                                controller: _state,
                                                decoration: InputDecoration(
                                                    hintText: 'State',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                    suffixIcon:
                                                        Icon(Icons.close),
                                                    suffixStyle: TextStyle(
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                    focusColor: Colors.black,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15)))),
                                              ),
                                            ),
                                          ),

                                          //hotel locatoin
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20, top: 10),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                                color: Colors.white,
                                              ),
                                              child: TextField(
                                                controller: _hotelLocation,
                                                decoration: InputDecoration(
                                                    hintText: 'Hotel Location',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                        fontWeight: FontWeight
                                                            .bold),
                                                    suffixIcon:
                                                        Icon(Icons.close),
                                                    suffixStyle: TextStyle(
                                                        color: Colors.black),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                    focusColor: Colors.black,
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xffeceff3),
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15)))),
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              width: 150,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  RegisterHotelInfo();
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HotelInfo()));
                                                },
                                                child: const Text('submit'),
                                                style: ElevatedButton.styleFrom(
                                                    primary:
                                                        const Color(0xff40cd7d),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "add HotelInfo",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    //show the Hotel info form the database
                    Container(child: Center(child: Column())),
                    FutureBuilder(
                        future: featchHotelInfo(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapShot) {
                          if (snapShot.hasData) {
                            final hoteinfodata = snapShot.data;
                            print(
                                'sdfjldfjfdkljf ${hoteinfodata[1]['hotelName']}');
                            print('${hoteinfodata[1]['hotelID']}');

                            return Column(
                              children: [
                                DataTable(
                                  columns: [
                                    DataColumn(label: Text('HotelId')),
                                    DataColumn(label: Text('HotelName')),
                                    DataColumn(label: Text('zipcode')),
                                    DataColumn(label: Text('City')),
                                    DataColumn(label: Text('State')),
                                    DataColumn(label: Text('Hotel Location')),
                                    DataColumn(label: Text('Action')),
                                  ],
                                  rows: [
                                    for (int i = 0;
                                        i < hoteinfodata.length;
                                        i++)
                                      DataRow(cells: [
                                        DataCell(Text(
                                            ' ${hoteinfodata[i]['hotelID']}')),
                                        DataCell(Text(
                                            ' ${hoteinfodata[i]['hotelName']}')),
                                        DataCell(Text(
                                            ' ${hoteinfodata[i]['zipCode']}')),
                                        DataCell(Text(
                                            ' ${hoteinfodata[i]['city']}')),
                                        DataCell(Text(
                                            ' ${hoteinfodata[i]['state']}')),
                                        DataCell(Text(
                                            ' ${hoteinfodata[i]['hotel_location']}')),
                                        DataCell(
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    deleteHotelInfo(
                                                        hoteinfodata[i]
                                                                ['hotelID']
                                                            .toString());
                                                  },
                                                  icon: Icon(Icons.delete)),
                                              IconButton(
                                                  onPressed: () {
                                                    showonedata(hoteinfodata[i]
                                                            ['hotelID']
                                                        .toString());
                                                    var hotelName =
                                                        hoteinfodata[i]
                                                            ["hotelName"];
                                                    var zipCode =
                                                        hoteinfodata[i]
                                                                ["zipCode"]
                                                            .toString();
                                                    var city =
                                                        hoteinfodata[i]["city"];
                                                    var state = hoteinfodata[i]
                                                        ["state"];
                                                    var hotel_location =
                                                        hoteinfodata[i]
                                                            ["hotel_location"];
                                                    var id = hoteinfodata[i]
                                                        ["hotelID"];

                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Dialog(
                                                            child: Container(
                                                              height: 550,
                                                              width: 400,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            10),
                                                                    child: Text(
                                                                      'please uplaod the hotel information',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top:
                                                                            10),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(15)),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        initialValue:
                                                                            hotelName,
                                                                        onChanged:
                                                                            (value) =>
                                                                                hotelName = value,
                                                                        decoration: InputDecoration(
                                                                            hintText: 'hotel name',
                                                                            hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                            suffixIcon: Icon(Icons.close),
                                                                            suffixStyle: TextStyle(color: Colors.black),
                                                                            enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15))),
                                                                            focusColor: Colors.black,
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  //zipcode textfeild
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top:
                                                                            10),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(15)),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        initialValue:
                                                                            zipCode,
                                                                        onChanged:
                                                                            (value) =>
                                                                                zipCode = value,
                                                                        decoration: InputDecoration(
                                                                            hintText: 'zip Code',
                                                                            hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                            suffixIcon: Icon(Icons.close),
                                                                            suffixStyle: TextStyle(color: Colors.black),
                                                                            enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15))),
                                                                            focusColor: Colors.black,
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  //city
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top:
                                                                            10),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(15)),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        initialValue:
                                                                            city,
                                                                        onChanged:
                                                                            (value) =>
                                                                                city = value,
                                                                        decoration: InputDecoration(
                                                                            hintText: 'City',
                                                                            hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                            suffixIcon: Icon(Icons.close),
                                                                            suffixStyle: TextStyle(color: Colors.black),
                                                                            enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15))),
                                                                            focusColor: Colors.black,
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  //state
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top:
                                                                            10),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(15)),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        initialValue:
                                                                            state,
                                                                        onChanged:
                                                                            (value) =>
                                                                                state = value,
                                                                        decoration: InputDecoration(
                                                                            hintText: 'State',
                                                                            hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                            suffixIcon: Icon(Icons.close),
                                                                            suffixStyle: TextStyle(color: Colors.black),
                                                                            enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15))),
                                                                            focusColor: Colors.black,
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  //hotel locatoin
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20,
                                                                        top:
                                                                            10),
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(15)),
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          TextFormField(
                                                                        initialValue:
                                                                            hotel_location,
                                                                        onChanged:
                                                                            (value) =>
                                                                                hotel_location = value,
                                                                        decoration: InputDecoration(
                                                                            hintText: 'Hotel Location',
                                                                            hintStyle: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                                                                            suffixIcon: Icon(Icons.close),
                                                                            suffixStyle: TextStyle(color: Colors.black),
                                                                            enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15))),
                                                                            focusColor: Colors.black,
                                                                            focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: Color(0xffeceff3),
                                                                                ),
                                                                                borderRadius: BorderRadius.all(Radius.circular(15)))),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                20),
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          150,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          UpdateHotelInfo(
                                                                              id,
                                                                              hotelName,
                                                                              zipCode,
                                                                              city,
                                                                              state,
                                                                              hotel_location);
                                                                          Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => HotelInfo()));
                                                                        },
                                                                        child: const Text(
                                                                            'submit'),
                                                                        style: ElevatedButton.styleFrom(
                                                                            primary:
                                                                                const Color(0xff40cd7d),
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  icon: Icon(Icons.edit))
                                            ],
                                          ),
                                        )
                                      ]),
                                  ],
                                  // rows: hoteinfodata
                                  //     .map<DataRow>((elment) =>
                                  //         DataRow(cells: [
                                  //           DataCell(Text(elment.hotelID)),
                                  //           DataCell(Text(elment.hotelName)),
                                  //           DataCell(Text(elment.zipCode)),
                                  //           DataCell(Text(elment.city)),
                                  //           DataCell(Text(elment.state)),
                                  //           DataCell(
                                  //               Text(elment.hotel_location)),
                                  //         ]))
                                  //     .toList()
                                ),
                              ],
                            );
                          } else if (snapShot.hasError) {
                            return Text(snapShot.error.toString());
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future RegisterHotelInfo() async {
    String APIURL = "http://127.0.0.1:8000/api/hotel-details/";

    modelHotelInfo model = modelHotelInfo(
      hotelName: _hotelName.text,
      zipCode: _ZipCode.text,
      city: _city.text,
      state: _state.text,
      hotel_location: _hotelLocation.text,
    );

    http.Response response =
        await http.post(Uri.parse(APIURL), body: model.toJson());
    if (response.statusCode == 200) {
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future UpdateHotelInfo(String id, String hotelName, String zipCode,
      String city, String state, String hotel_location) async {
    String APIURL = "http://127.0.0.1:8000/api/hotel-details/";

    modelHotelInfo model = modelHotelInfo(
      hotelName: hotelName,
      zipCode: zipCode,
      city: city,
      state: state,
      hotel_location: hotel_location,
    );

    http.Response response =
        await http.put(Uri.parse(APIURL + id), body: model.toJson());
    if (response.statusCode == 200) {
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future RegisterRoomInfo() async {
    String APIURL = "http://127.0.0.1:8000/api/room-details/";

    modelRoomInfo model = modelRoomInfo(
      room_type: _room_type.text,
      room_price: _room_price.text,
      number_of_beds: _number_of_beds.text,
      hotelID: _hotelID.text,
      roomImage: _roomImage.text,
    );
    print(model.toJson());

    http.Response response =
        await http.post(Uri.parse(APIURL), body: model.toJson());
    if (response.statusCode == 200) {
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future deleteHotelInfo(String id) async {
    String APIURL = "http://127.0.0.1:8000/api/hotel-delete/";

    http.Response response = await http.delete(Uri.parse(APIURL + id));
    print(APIURL + id);
    if (response.statusCode == 200 || response.statusCode == 204) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HotelInfo()));
      print("sucessfully delete the data from the database");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future showonedata(String id) async {
    String APIURL = "http://127.0.0.1:8000/api/hotel-data/";
    http.Response response = await http.get(Uri.parse(APIURL + id));
    print(APIURL + id);
    if (response.statusCode == 200 || response.statusCode == 204) {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => HotelInfo()));
      print("sucessfully delete the data from the database");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }
}
