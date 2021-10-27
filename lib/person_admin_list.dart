import 'package:flutter/material.dart';
import 'package:user_admin_example/database_helper.dart';
import 'package:user_admin_example/usermodel.dart';

class PersonListInAdmin extends StatefulWidget {
  PersonListInAdmin({this.userModelDetails});

  UserModelDetails? userModelDetails;

  @override
  _PersonListInAdminState createState() => _PersonListInAdminState();
}

class _PersonListInAdminState extends State<PersonListInAdmin> {
  List<UserModelDetails> userModelDetailslist = [];

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users List'),
          automaticallyImplyLeading: true,
        ),
        body: ListView.builder(
          itemCount: userModelDetailslist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(userModelDetailslist[index].name!),
              subtitle: Text(userModelDetailslist[index].email!),
              trailing: IconButton(
                onPressed: () async {
                  // await DatabaseHelperInfo()
                  //     .deleteUsers(userModelDetailslist[index]);
                  // getUserList();
                  showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text('Please Confirm'),
                          content:
                              const Text('Are you sure to remove the item ?'),
                          actions: [
                            // The "Yes" button
                            TextButton(
                                onPressed: () async {
                                  await DatabaseHelperInfo()
                                      .deleteUsers(userModelDetailslist[index]);
                                  getUserList();
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes')),
                            TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No'))
                          ],
                        );
                      });
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
    );
  }

  void getUserList() async {
    debugPrint("Getting Data From Db");
    userModelDetailslist = await DatabaseHelperInfo().getAllUserList();
    setState(() {});
  }
}
