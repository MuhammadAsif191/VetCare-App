import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Reference get firebaseStorage => FirebaseStorage.instance.ref();
final app = FirebaseFirestore.instance.collection('Post').get();

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

List<FlateListUser> allData = [];

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
    app.then((QuerySnapshot querySnapshot) => {
          allData = [],
          querySnapshot.docs.forEach((element) {
            print(element['email']);
            setState(() {
              allData.add(FlateListUser(
                  userName: element['email'],
                  description: element['Description'],
                  picturePath: element['image'],
                  likes: 200));
              // allData.add(FlateListUser(element['name'], element['status']));
            });
          })
          // GetData();
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreatePost(DocName: widget.DoctorName)),
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
              color: Colors.white,
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
              child: Image.network(widget.pic),
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

class MyProducts extends StatelessWidget {
  MyProducts({
    Key? key,
    required this.imageLoc,
    required this.price,
    required this.shipping,
    required this.title,
  }) : super(key: key);
  final String imageLoc;
  final String title;
  final int price;
  final String shipping;

  @override
  Widget build(BuildContext context) {
    const kDefaultPaddin = 20.0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.grey[500],
        padding: EdgeInsets.all(0),
      ),
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.all(kDefaultPaddin / 4),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin / 4),
                // height: 180,
                // width: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(imageLoc),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                kDefaultPaddin / 4,
                kDefaultPaddin / 4,
                0,
                0,
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                kDefaultPaddin / 5,
                kDefaultPaddin / 5,
                0,
                0,
              ),
              child: Text(
                'Rs. ' + price.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                  kDefaultPaddin / 5,
                  kDefaultPaddin / 5,
                  0,
                  0,
                ),
                child: Text(shipping))
          ],
        ),
      ),
    );
  }
}

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key, required this.DocName}) : super(key: key);
// final String d
  final String DocName;
  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController description = new TextEditingController();
  TextEditingController diseaseImg = new TextEditingController();
  File _image = new File('/dev/null');
  // final  Addpost=FirebaseDatabase.instance.
  @override
  Future getImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (image == null) {
      print('failed');
      return;
    }

    setState(() {
      var imageTemporary = File(image.path);
      this._image = imageTemporary;
      print('Not Null');
      print('${image.path}');
      print('Pathe::Printed');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  print('hello');
                  this.getImage();
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 100,
                alignment: Alignment.center,
                // color: Colors.red,
                child: _image.path != '/dev/null'
                    ? Image.file(
                        _image,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.add_a_photo_outlined,
                        size: 100,
                      ),
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
                  // if (description.text != ' ' && description.text != '')
                  //   allData.add(FlateListUser(
                  //     userName: widget.DoctorName,
                  //     description: description.text,
                  //     picturePath: 'images/Doctor.jpeg',
                  //     likes: 0,
                  //   ));
                });
                // Navigator.pop(context);
                // print("Welcome sherazx");
                // uploadImageToFirebase();
                uploadImageToFirebase();
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
        ),
      ),
    );
  }

  void AddDatainFIrebase(String val) async {
    // print("object");
    // print(val);
    // print(widget.DocName);

    FirebaseFirestore.instance.collection('Post').doc().set({
      "image": val,
      "email": widget.DocName,
      "Description": description.text
    }).then((value) => Navigator.pop(context));
  }

  Future uploadImageToFirebase() async {
    final _firebaseStorage = FirebaseStorage.instance;
    PickedFile image;
    //Check Permission
    //Select Image
    int date = DateTime.now().microsecondsSinceEpoch;
    var file = File(_image.path);

    if (_image != null) {
      //Upload to Firebase
      var snapshot =
          await _firebaseStorage.ref().child("${date}/").putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();
      // print(downloadUrl);
      AddDatainFIrebase(downloadUrl);
    } else {
      print('No Image Path Received');
    }
  }
}
