import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'FlateListData.dart';
import 'PostFeedBackSent.dart';

class feedback extends StatefulWidget {
  feedback({Key? key, required this.Email}) : super(key: key);
  final String Email;

  @override
  State<feedback> createState() => _feedbackPage();
}

class _feedbackPage extends State<feedback> {
  List<FlateListData> allData = [
    FlateListData(
      '3101 N Tarrant Pkwy',
    ),
    FlateListData(
      '3101 N Tarrant Pkwy',
    ),
    FlateListData(
      '3101 N Tarrant Pkwy',
    ),
    FlateListData(
      "Dr.Rizwan",
    ),
  ];

  // Map<dynamic, dynamic> get newMethod {
  //   return {
  //     "countRating": 2,
  //     "titleName": "Dr.Bilal",
  //     "location": '3101 N Tarrant Pkwy',
  //     "rating": 3,
  //     "distance": 1200,
  //     "time": '12:12',
  //   };
  // }

  List<FlateListData> foundList = [];
  String? search_ListView = '';
  TextEditingController searchController = TextEditingController();
  Icon CostumIcon = Icon(Icons.search);
  bool IconControl = false;
  Widget TextInput = Text('Feedback');
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   foundList = allData;
    // });

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
  }

  // onSearch(String search) {
  //   setState(() {
  //     foundList = allData
  //         .where((FlateListData) => FlateListData.titleName
  //             .toLowerCase()
  //             .contains(search.toLowerCase()))
  //         .toList();
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        title: TextInput,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              IconControl = !IconControl;
              setState(
                () {
                  if (IconControl) {
                    CostumIcon = Icon(Icons.cancel_outlined);
                    TextInput = TextField(
                      controller: searchController,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: UnderlineInputBorder(),
                        labelText: "Search doctor name",
                      ),
                      // onChanged: (Text) => onSearch(Text),
                    );
                  } else {
                    CostumIcon = Icon(Icons.search);
                    TextInput = Text('Feedback');
                    searchController.text = '';
                    // setState(() {
                    //   foundList = allData;
                    // });
                  }
                },
              );
            },
            icon: CostumIcon,
          ),
        ],
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
            child: allData.length > 0
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: allData.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return hospitalList(
                          titleName: allData[index].titleName,
                          Email: widget.Email);
                    },
                  )
                : Center(
                    child: Text(
                      'Oops...\nDoctor not found.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class hospitalList extends StatelessWidget {
  hospitalList({this.titleName = 'hello', this.Email = ''});
  String titleName;
  String Email;
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
                    PostFeedback(userName: titleName, Email: Email)),
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
