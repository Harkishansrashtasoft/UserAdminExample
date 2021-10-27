import 'package:flutter/material.dart';
import 'package:user_admin_example/database_helper.dart';
import 'package:user_admin_example/usermodel.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({this.userModelDetails});

  UserModelDetails? userModelDetails;

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // The inital group value
  String selectedUserType = 'user';

  @override
  void initState() {
    nameController.text = widget.userModelDetails!.name!;
    emailController.text = widget.userModelDetails!.email!;
    passwordController.text = widget.userModelDetails!.password!;
    selectedUserType = widget.userModelDetails!.userType!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Edit user details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Column(
                children: [
                  Text(
                    'Please select type',
                    style: TextStyle(fontSize: 16),
                  ),
                  ListTile(
                    title: Text('User'),
                    leading: Radio(
                      groupValue: selectedUserType,
                      value: 'user',
                      onChanged: (String? value) {
                        setState(() {
                          selectedUserType = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Admin'),
                    leading: Radio(
                      groupValue: selectedUserType,
                      value: 'admin',
                      onChanged: (String? value) {
                        setState(() {
                          selectedUserType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (widget.userModelDetails != null) {
                    updateUserInfo();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Update Failed"),
                    ));
                  }
                },
                child: Text('Update details'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> updateUserInfo() async {
    UserModelDetails userModelDetails = UserModelDetails();
    userModelDetails.id = widget.userModelDetails!.id!;
    userModelDetails.name = nameController.text;
    userModelDetails.email = emailController.text;
    userModelDetails.password = passwordController.text;
    userModelDetails.userType = selectedUserType;

    int result = await DatabaseHelperInfo().updateUserDetails(userModelDetails);
    Navigator.pop(context);
  }
}
