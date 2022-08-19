import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/PaymentFromUser.dart';
import 'package:vet_care_app/UI/postFeedBack.dart';
import 'package:vet_care_app/UI/storeForVetCare.dart';
import 'UserData.dart';
import 'ViewLDoctor.dart';
import 'Complaints.dart';
import 'Profile.dart';
import 'ViewVetCureDetailsUser.dart';
import 'viewCureDetail.dart';

class UserMenu extends StatefulWidget {
  @override
  State<UserMenu> createState() => UserMenuPage();
}

class UserMenuPage extends State<UserMenu> {
  int ComplaintsNoti = 1;
  int DoctorNoti = 2;
  int PostFeedbackNoti = 3;
  int ComplaintsStatusNoti = 4;
  int CureDetailsNoti = 5;
  int ReportNoti = 6;
  String User = 'Qasim';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'User Panel',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'Welcome ',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
                Container(
                  child: Text(
                    User,
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  child: Container(
                    child: UserCard(
                      Notification: ReportNoti,
                      icon: Icon(Icons.person),
                      text: 'My Profile',
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profiles()),
                    );
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Container(
                    child: UserCard(
                      Notification: CureDetailsNoti,
                      icon: Icon(Icons.payment),
                      text: 'Make Payment',
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userpayments()),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: FlatButton(
                  child: Container(
                    child: UserCard(
                      Notification: ComplaintsNoti,
                      icon: Icon(Icons.message),
                      text: 'Complaints',
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComplaintsDoctor()),
                    );
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: Container(
                    child: UserCard(
                      Notification: DoctorNoti,
                      icon: Icon(Icons.man_sharp),
                      text: 'View Doctor',
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hospital()),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: FlatButton(
                  child: Container(
                    child: UserCard(
                      Notification: PostFeedbackNoti,
                      icon: Icon(Icons.feedback_outlined),
                      text: 'Post Feedback',
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => feedback()),
                    );
                  },
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewSolutionUser(
                                UserName: User,
                              )),
                    );
                  },
                  child: Container(
                    child: UserCard(
                      Notification: CureDetailsNoti,
                      icon: Icon(Icons.data_saver_off_rounded),
                      text: 'View Vet Cure Details',
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                    child: Container(
                      child: UserCard(
                        Notification: ReportNoti,
                        icon: Icon(Icons.shopping_cart_outlined),
                        text: 'Store',
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreMainScreen(),
                        ),
                      );
                    }),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  UserCard({
    this.text = '',
    this.Notification = -1,
    this.icon,
  });

  final String text;
  final int Notification;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 3,
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor:
                            Notification < 1 ? Colors.green : Colors.white,
                        child: Notification < 1
                            ? Text(Notification.toString())
                            : Text(' '),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: icon,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
