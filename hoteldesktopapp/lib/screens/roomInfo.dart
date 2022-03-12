// ignore_for_file: file_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RoomInfo extends StatefulWidget {
  const RoomInfo({Key? key}) : super(key: key);

  @override
  State<RoomInfo> createState() => _RoomInfoState();
}

class _RoomInfoState extends State<RoomInfo> {
  TextEditingController _room_type = TextEditingController();

  TextEditingController _room_price = TextEditingController();

  TextEditingController _number_of_beds = TextEditingController();
  TextEditingController _hotelID = TextEditingController();

  TextEditingController _roomImage = TextEditingController();

  Uint8List? imagevalue;
  String? imagename;

  uploadimagepost() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:8000/api/room-details/'));
    //request.headers['Authorization'] ='bearer $authorizationToken';
    request.fields['room_type'] = _room_type.text;
    request.fields['room_price'] = _room_price.text;
    request.fields['number_of_beds'] = _number_of_beds.text;
    request.fields['hotelID'] = _hotelID.text;
    request.files.add(
      http.MultipartFile.fromBytes('roomImage', imagevalue!,
          filename: imagename),
    );
    var response = await request.send();
    print(response.stream);
    print(response.statusCode);
    final res = await http.Response.fromStream(response);
    print(res.body);
  }

  Future featchHotelInfo() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/room-details/'));

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
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: TextButton(
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
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'please uplaod the hotel room information',
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
                                          controller: _room_type,
                                          decoration: InputDecoration(
                                              hintText: 'room_type',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              suffixIcon: Icon(Icons.close),
                                              suffixStyle: TextStyle(
                                                  color: Colors.black),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              focusColor: Colors.black,
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15)))),
                                        ),
                                      ),
                                    ),

                                    // room_price
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
                                          controller: _room_price,
                                          decoration: InputDecoration(
                                              hintText: 'room_price',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              suffixIcon: Icon(Icons.close),
                                              suffixStyle: TextStyle(
                                                  color: Colors.black),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              focusColor: Colors.black,
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              15)))),
                                        ),
                                      ),
                                    ),

                                    //number_of_beds
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
                                          controller: _number_of_beds,
                                          decoration: InputDecoration(
                                              hintText: 'number_of_beds',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              suffixIcon: Icon(Icons.close),
                                              suffixStyle: TextStyle(
                                                  color: Colors.black),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              focusColor: Colors.black,
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
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
                                          controller: _hotelID,
                                          decoration: InputDecoration(
                                              hintText: 'HotelID',
                                              hintStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              suffixIcon: Icon(Icons.close),
                                              suffixStyle: TextStyle(
                                                  color: Colors.black),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15))),
                                              focusColor: Colors.black,
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xffeceff3),
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
                                        child: InkWell(
                                          onTap: () => uploadImage(),
                                          child: TextField(
                                            controller: _roomImage,
                                            decoration: InputDecoration(
                                                hintText: 'roomImage',
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                suffixIcon: IconButton(
                                                    onPressed: () =>
                                                        uploadImage(),
                                                    icon:
                                                        Icon(Icons.file_copy)),
                                                suffixStyle: TextStyle(
                                                    color: Colors.black),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xffeceff3),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                focusColor: Colors.black,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xffeceff3),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15)))),
                                          ),
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
                                            uploadimagepost();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RoomInfo()));
                                          },
                                          child: const Text('submit'),
                                          style: ElevatedButton.styleFrom(
                                              primary: const Color(0xff40cd7d),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
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
                      "add roomInfo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            FutureBuilder(
                future: featchHotelInfo(),
                builder: (BuildContext context, AsyncSnapshot snapShot) {
                  if (snapShot.hasData) {
                    final hoteinfodata = snapShot.data;

                    print("hotel informatin");
                    print(hoteinfodata);

                    return Column(
                      children: [
                        DataTable(
                          columns: [
                            DataColumn(label: Text('room_type')),
                            DataColumn(label: Text('room_price')),
                            DataColumn(label: Text('number_of_beds')),
                            DataColumn(label: Text('hotelID')),
                            DataColumn(label: Text('roomImage')),
                            DataColumn(label: Text('Action')),
                          ],
                          rows: [
                            for (int i = 0; i < hoteinfodata.length; i++)
                              DataRow(cells: [
                                DataCell(
                                    Text(' ${hoteinfodata[i]['room_type']}')),
                                DataCell(
                                    Text(' ${hoteinfodata[i]['room_price']}')),
                                DataCell(Text(
                                    ' ${hoteinfodata[i]['number_of_beds']}')),
                                DataCell(
                                    Text(' ${hoteinfodata[i]['hotelID']}')),
                                DataCell(
                                    // Text(' ${hoteinfodata[i]['roomImage']}'
                                    // )
                                    Image.network(
                                        'http://127.0.0.1:8000${hoteinfodata[i]['roomImage']}')),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          icon: Icon(Icons.delete)),
                                      IconButton(
                                          onPressed: () {},
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
    );
  }

  uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'svg', 'jpeg']);

    if (result != null) {
      Uint8List? file = result.files.first.bytes;
      String sc = result.files.single.name;

      setState(() {
        imagename = sc;
        imagevalue = file;
      });
    } else {
      print('file not choose');
    }
    // User canceled the picker
  }
}
