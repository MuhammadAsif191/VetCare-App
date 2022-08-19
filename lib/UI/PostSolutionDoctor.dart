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

class PostSolutionDoctor extends StatefulWidget {
  PostSolutionDoctor({required this.DoctorName});
  final String DoctorName;
  @override
  State<PostSolutionDoctor> createState() => _PostSolutionDoctorPage();
}

class _PostSolutionDoctorPage extends State<PostSolutionDoctor> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: ((context) => postNews(context)),
        ),
        child: Container(
          alignment: Alignment.bottomRight,
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.green[500],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 50,
            ),
          ),
        ),
      ),
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
                return hospitalList(
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

  Widget postNews(BuildContext context) {
    TextEditingController diseaseImg = new TextEditingController();
    TextEditingController description = new TextEditingController();
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 100,
          alignment: Alignment.center,
          // color: Colors.red,
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 100,
          ),
        ),
        Container(
          width: 200,
          alignment: Alignment.topCenter,
          child: TextField(
            controller: description,
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Enter Description about this Disease...',
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              description.text = description.text.replaceAll('  ', '');
              if (description.text != ' ' && description.text != '')
                allData.add(FlateListUser(
                  userName: widget.DoctorName,
                  description: description.text,
                  picturePath: 'images/Doctor.jpeg',
                  likes: 0,
                ));
            });
            Navigator.pop(context);
          },
          child: Container(
            height: 70,
            // width: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 50, right: 50, top: 20),
            decoration: BoxDecoration(
              color: Colors.green[500],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}

class hospitalList extends StatefulWidget {
  hospitalList({
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
  State<hospitalList> createState() => _hospitalListState();
}

class _hospitalListState extends State<hospitalList> {
  bool flag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData;
  }

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      onPressed: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) => editNews(context)),
      ),
      onLongPress: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: ((context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        allData.removeAt(widget.index);
                      });
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[600],
                    ),
                    child: Text('Delete')),
              ],
            )),
      ),
      child: Card(
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
                    padding: EdgeInsets.only(
                        left: 20, top: 10, right: 10, bottom: 10),
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
      ),
    );
  }

  Widget editNews(BuildContext context) {
    TextEditingController diseaseImg = new TextEditingController();
    TextEditingController description = new TextEditingController();
    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          height: 100,
          alignment: Alignment.center,
          // color: Colors.red,
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 100,
          ),
        ),
        Container(
          width: 200,
          alignment: Alignment.topCenter,
          child: TextField(
            controller: description,
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Enter Description about this Disease...',
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              description.text = description.text.replaceAll('  ', '');
              if (description.text != ' ' && description.text != '') {
                allData[widget.index].description = description.text;
                allData[widget.index].picturePath = 'images/Doctor.jpeg';
              }
            });
            Navigator.pop(context);
          },
          child: Container(
            height: 70,
            // width: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 50, right: 50, top: 20),
            decoration: BoxDecoration(
              color: Colors.green[500],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
