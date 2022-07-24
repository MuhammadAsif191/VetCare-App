import 'package:flutter/material.dart';
import 'DoctorMakeCall.dart';

class Users extends StatefulWidget {
  Users({Key? key}) : super(key: key);
  @override
  State<Users> createState() => _UsersPage();
}

class flateUser {
  flateUser(
    this.userName,
  );
  final String userName;
}

class _UsersPage extends State<Users> {
  final List<flateUser> allData = [
    flateUser(
      "Dr.Rizwan",
    ),
    flateUser(
      "Dr.Sajid",
    ),
    flateUser(
      "Dr.Maryam",
    ),
    flateUser(
      "Dr.Ali",
    ),
  ];

  // Map<dynamic, dynamic> get newMethod {
  //   return {
  //     "countRating": 2,
  //     "titleName": "apple",
  //     "location": '3101 N Tarrant Pkwy',
  //     "rating": 3,
  //     "distance": 1200,
  //     "time": '12:12',
  //   };
  // }

  List<flateUser> foundList = [];
  String? search_ListView = '';
  TextEditingController searchController = TextEditingController();
  Icon CostumIcon = Icon(Icons.search);
  bool IconControl = false;
  Widget TextInput = Text('User');
  Widget image = Image.asset(
    "AppLogo.jpeg",
  );
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
          .where((flateUser) =>
              flateUser.userName.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green[800],
        title: TextInput,
        leading: CircleAvatar(
          child: image,
          radius: 15,
        ),
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
                    TextInput = Text('User');
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
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.map_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Patients',
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
                                titleName: foundList[index].userName,
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
    this.titleName = 'hello',
    // this.userPic=Image.asset('images/Share.jpeg'),
  });
  String titleName;
  // Widget userPic;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => doctorsMakeCalls(DoctorName: titleName),
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
