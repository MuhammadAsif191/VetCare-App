import 'package:flutter/material.dart';
import 'package:vet_care_app/UI/UserList.dart';
import 'DoctorList.dart';

class UserAndDoctor extends StatefulWidget {
  const UserAndDoctor({Key? key}) : super(key: key);

  @override
  State<UserAndDoctor> createState() => UserAndDoctorState();
}

class UserAndDoctorState extends State<UserAndDoctor>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedTabIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: 2, vsync: this, initialIndex: selectedTabIndex);
    tabController.addListener(() {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    });
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[600],
          title: Text(
            "Doctor And User",
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => MyAccountScreen(),
                  //   ),
                  // );
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text('Blocked'),
                ),
              ],
            ),
          ],
          bottom: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Doctors",
              ),
              Tab(
                text: "Users",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            doctorLists(),
            userLists(),
          ],
        ),
      ),
    );
  }
}
