import 'package:flutter/material.dart';
import 'FlateListData.dart';
import 'MakeCall.dart';

class Hospital extends StatefulWidget {
  Hospital({Key? key}) : super(key: key);
  @override
  State<Hospital> createState() => _HospitalPage();
}

class _HospitalPage extends State<Hospital> {
  final List<FlateListData> allData = [
    FlateListData(
      3,
      "Dr.Rizwan",
      '3101 N Tarrant Pkwy',
      100,
      '5:00',
    ),
    FlateListData(
      4,
      "Dr.Sajid",
      '3101 N Tarrant Pkwy',
      120,
      '00:12',
    ),
    FlateListData(
      2,
      "Dr.Maryam",
      '3101 N Tarrant Pkwy',
      1000,
      '6:00',
    ),
    FlateListData(
      3,
      "Dr.Ali",
      '3101 N Tarrant Pkwy',
      50,
      '00:49',
    ),
  ];

  Map<dynamic, dynamic> get newMethod {
    return {
      "countRating": 2,
      "titleName": "apple",
      "location": '3101 N Tarrant Pkwy',
      "rating": 3,
      "time": '12:12',
    };
  }

  List<FlateListData> foundList = [];
  String? search_ListView = '';
  TextEditingController searchController = TextEditingController();
  Icon CostumIcon = Icon(Icons.search);
  bool IconControl = false;
  Widget TextInput = Text('View Doctors');
  @override
  void initState() {
    super.initState();
    setState(() {
      foundList = allData;
    });
  }

  onSearch(String search) {
    setState(() {
      foundList = allData
          .where((FlateListData) => FlateListData.titleName
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[800],
        title: TextInput,
        actions: [
          IconButton(
            onPressed: () {
              IconControl = !IconControl;
              setState(
                () {
                  if (IconControl) {
                    CostumIcon = Icon(Icons.cancel_outlined);
                    TextInput = TextField(
                      controller: searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: UnderlineInputBorder(),
                        labelText: "Search hospital name",
                      ),
                      onChanged: (Text) => onSearch(Text),
                    );
                  } else {
                    CostumIcon = Icon(Icons.search);
                    TextInput = Text('');
                    searchController.text = 'View Doctors';
                    setState(() {
                      foundList = allData;
                    });
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
              'Doctor',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: foundList.length > 0
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: foundList.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return hospitalList(
                                mint: foundList[index].time,
                                titleName: foundList[index].titleName,
                                countRating: foundList[index].countRating,
                                rating: foundList[index].rating,
                                location: foundList[index].location,
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
  hospitalList({
    this.mint = '12:12',
    this.titleName = 'hello',
    this.location = 'asif',
    this.rating = 1,
    this.countRating = 3,
  });
  String mint;
  int countRating;
  String titleName;
  String location;
  int rating;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => makeCalls(
                DoctorName: titleName,
              ),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        child: Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Expanded(
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
                              color: Colors.black87,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            location,
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: (countRating < 1)
                                  ? Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    )
                                  : Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                            ),
                            Container(
                              child: (countRating < 2)
                                  ? Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    )
                                  : Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                            ),
                            Container(
                              child: (countRating < 3)
                                  ? Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    )
                                  : Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                            ),
                            Container(
                              child: (countRating < 4)
                                  ? Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    )
                                  : Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                            ),
                            Container(
                              child: (countRating < 5)
                                  ? Icon(
                                      Icons.star_border,
                                      color: Colors.yellow,
                                    )
                                  : Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
