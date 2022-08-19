import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/ManageCureDoctor.dart';
import 'UserData.dart';
import 'viewDoctorFeedback.dart';
import 'PostSolutionDoctor.dart';
import 'DoctorComplaints.dart';
import 'ViewUser.dart';
import 'DoctorPaymentCardDetail.dart';

class DoctorMenu extends StatefulWidget {
  @override
  State<DoctorMenu> createState() => DoctorMenuPage();
}

class DoctorMenuPage extends State<DoctorMenu> {
  // UserData User = UserData();
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Doctor Panel',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
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
              height: 10,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        child: Container(
                          child: UserCard(
                            Notification: ReportNoti.toString(),
                            icon: Icon(Icons.manage_search),
                            text: 'Manage Cure',
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
                                builder: (context) =>
                                    ManageCureDoctorWithRecientUsers()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Container(
                          child: UserCard(
                            Notification: CureDetailsNoti.toString(),
                            icon: Icon(Icons.post_add_rounded),
                            text: 'Post Solution',
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
                              builder: (context) => PostSolutionDoctor(
                                DoctorName: User,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Container(
                          child: UserCard(
                            Notification: ComplaintsNoti.toString(),
                            icon: Icon(Icons.file_open_outlined),
                            text: 'View Complaints',
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
                              builder: (context) => complaintsDoctors(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Container(
                          child: UserCard(
                            Notification: DoctorNoti.toString(),
                            icon: Icon(Icons.man_sharp),
                            text: 'View User Detail',
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
                              builder: (context) => Users(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Container(
                          child: UserCard(
                            Notification: PostFeedbackNoti.toString(),
                            icon: Icon(Icons.feedback_outlined),
                            text: 'Feedback Details',
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
                              builder: (context) => feedbackDoctors(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Container(
                          child: UserCard(
                            Notification: ComplaintsStatusNoti.toString(),
                            icon: Icon(Icons.messenger_sharp),
                            text: 'View Payment Detail',
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
                              builder: (context) => DoctorAddPaymentsDetail(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  UserCard({
    this.text = '',
    this.Notification = '',
    this.icon,
  });

  final String text, Notification;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
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
                        backgroundColor: Colors.green,
                        child: Text(Notification),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                child: icon,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
