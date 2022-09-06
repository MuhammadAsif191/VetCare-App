import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../smallDataModels/FlateListData.dart';
import 'ComplainBox.dart';

class ComplaintsDoctor extends StatefulWidget {
  ComplaintsDoctor({required this.Email});

  // ComplaintsDoctor({Key? key}) : super(key: key);
  final String Email;
  @override
  State<ComplaintsDoctor> createState() => _HospitalPage();
}

class _HospitalPage extends State<ComplaintsDoctor> {
  List<FlateListData> allData = [];

  List<FlateListData> foundList = [];
  TextEditingController searchController = TextEditingController();
  var Email = 'Temp';
  Widget TextInput = Text('Complaints');
  @override
  void initState() {
    super.initState();
    var app = FirebaseFirestore.instance.collection('doctor').get();

    app.then((QuerySnapshot querySnapshot) => {
          // allData=[],
          allData = [],
          querySnapshot.docs.forEach((element) {
            print(element['name']);
            setState(() {
              allData.add(FlateListData(element['name']));
            });
          })
        });
    setState(() {
      Email = widget.Email;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        title: TextInput,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Doctors',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: allData.length > 0
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: allData.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return hospitalList(
                                titleName: allData[index].titleName,
                                EmailUser: widget.Email,
                                // Email:widget.Email;
                                // countRating: allData[index].countRating,
                                // rating: allData[index].rating,
                                // location: allData[index].location,
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              'Oops...\nDoctor not found.',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
        ],
      ),
    );
  }
}

class hospitalList extends StatelessWidget {
  hospitalList({this.titleName = 'hello', this.EmailUser = ''});
  String titleName;
  String EmailUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    complaintBox(DoctorName: titleName, Email: this.EmailUser)),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        titleName,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
