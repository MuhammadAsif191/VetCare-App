import 'package:flutter/material.dart';
import 'FlateListData.dart';
import 'PostviewCureDetailSent.dart';
import 'package:flutter/cupertino.dart';

class viewCureDetail extends StatefulWidget {
  @override
  State<viewCureDetail> createState() => _viewCureDetailPage();
}

class _viewCureDetailPage extends State<viewCureDetail> {
  final List<FlateListData> allData = [
    FlateListData(
      3,
      "Dr.Rizwa",
      '3101 N Tarrant Pkwy',
      2,
      100,
      '5:00',
    ),
    FlateListData(
      4,
      "Dr.Ahmad",
      '3101 N Tarrant Pkwy',
      2,
      120,
      '00:12',
    ),
    FlateListData(
      2,
      "Dr.Shabana",
      '3101 N Tarrant Pkwy',
      3,
      1000,
      '6:00',
    ),
    FlateListData(
      3,
      "Dr.Marya",
      '3101 N Tarrant Pkwy',
      3,
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
      "distance": 1200,
      "time": '12:12',
    };
  }

  List<FlateListData> foundList = [];
  String? search_ListView = '';
  TextEditingController searchController = TextEditingController();
  Icon CostumIcon = Icon(Icons.search);
  bool IconControl = false;
  Widget TextInput = Text('View Cure Detail');
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
                      onChanged: (Text) => onSearch(Text),
                    );
                  } else {
                    CostumIcon = Icon(Icons.search);
                    TextInput = Text('View Cure Detail');
                    searchController.text = '';
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
                                distance: foundList[index].distance,
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
    this.distance = 1300,
    this.countRating = 3,
  });
  String mint;
  int countRating;
  String titleName;
  String location;
  int rating;
  int distance;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => viewcureDetail(
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
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
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
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            location,
                            style: TextStyle(color: Colors.grey[500]),
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
                        Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.blue[400],
                                ),
                              ),
                              Container(
                                child: Text(
                                  distance.toString() + 'm',
                                  style: TextStyle(
                                    color: Colors.blue[400],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
