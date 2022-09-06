import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/Doctor/ManageCureDoctor.dart';
import 'ChatToAdmin.dart';
import 'viewDoctorFeedback.dart';
import 'PostSolutionDoctor.dart';
import 'DoctorComplaints.dart';
import 'ViewUser.dart';
import 'DoctorPaymentCardDetail.dart';

class DoctorMenu extends StatefulWidget {
  DoctorMenu({required this.DoctorName, required this.DoctorEmail});
  final String DoctorName;
  final String DoctorEmail;
  @override
  State<DoctorMenu> createState() => DoctorMenuPage();
}

class DoctorMenuPage extends State<DoctorMenu> {
  // UserData User = UserData();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorAddPaymentsDetail()),
        ),
        child: Container(
            alignment: Alignment.center,
            height: 60,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.green[500],
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text('Payments')),
      ),
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
                      widget.DoctorName,
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
                                    ManageCureDoctorWithRecientUsers(
                                      idname: widget.DoctorEmail,
                                    )),
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
                                DoctorName: widget.DoctorName,
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
              height: 40,
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
              height: 40,
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
                            icon: Icon(Icons.messenger_sharp),
                            text: 'Chat To Admin',
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
                              builder: (context) => AdminDoctorChat(
                                DoctorName: widget.DoctorName,
                                doctorMail: widget.DoctorEmail,
                                userMail: 'admin@gmail.com',
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
              height: 70,
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
    this.icon,
  });

  final String text;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
