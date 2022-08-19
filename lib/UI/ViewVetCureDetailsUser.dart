import 'package:flutter/material.dart';

class FlateListUser {
  FlateListUser({
    required this.userName,
    required this.description,
    required this.picturePath,
    required this.likes,
  });
  String userName;
  String description;
  String picturePath;
  int likes;
}

List<FlateListUser> allData = [
  FlateListUser(
    userName: 'Qasim',
    description: 'this Feaver is veru dangerous',
    picturePath: 'images/Doctor.jpeg',
    likes: 5,
  ),
  FlateListUser(
    userName: 'Qasim',
    description: 'this Feaver is veru dangerous',
    picturePath: 'images/Hospital.jpeg',
    likes: 225,
  ),
  FlateListUser(
      userName: 'Qasim',
      description: 'this Feaver is veru dangerous',
      picturePath: 'images/Doctor.jpeg',
      likes: 2546),
];

class ViewSolutionUser extends StatefulWidget {
  ViewSolutionUser({required this.UserName});
  final String UserName;
  @override
  State<ViewSolutionUser> createState() => _ViewSolutionUserPage();
}

class _ViewSolutionUserPage extends State<ViewSolutionUser> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        foregroundColor: Colors.white,
        title: Text('Post Solution'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: allData.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return PostLisys(
                  userName: allData[index].userName,
                  description: allData[index].description,
                  pic: allData[index].picturePath,
                  likes: allData[index].likes,
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostLisys extends StatefulWidget {
  PostLisys({
    required this.userName,
    required this.description,
    required this.pic,
    required this.likes,
    required this.index,
  });
  final String userName;
  final String description;
  final String pic;
  int likes;
  final int index;
  @override
  State<PostLisys> createState() => _PostLisysState();
}

class _PostLisysState extends State<PostLisys> {
  bool flag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData;
  }

  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  // color: Colors.grey[200],
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '@' + widget.userName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              flag = !flag;
                              if (flag)
                                widget.likes = widget.likes + 1;
                              else
                                widget.likes--;
                            });
                          },
                          child: Container(
                            child: flag
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                        Container(
                          child: Text(widget.likes.toString()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // color: Colors.grey[200],
            padding: EdgeInsets.only(left: 10, top: 5),
            alignment: Alignment.topLeft,
            child: Text(
              widget.description,
            ),
          ),
          Container(
            height: 250,
            child: Image.asset(widget.pic),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
