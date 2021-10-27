import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:user_admin_example/database_helper.dart';
import 'package:user_admin_example/log_in.dart';
import 'package:user_admin_example/usermodel.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // The inital group value
  String selectedUserType = 'user';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign up'),
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter E-mail';
                    }
                    return null;
                  },
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ElevatedButton(
                  onPressed: () async {
                    addUserDetails();
                  },
                  child: Text('Sign up'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(children: const <Widget>[
                  Expanded(
                      child: Divider(
                    height: 5,
                    color: Colors.grey,
                  )),
                  Text("OR"),
                  Expanded(
                      child: Divider(
                    height: 5,
                    color: Colors.grey,
                  )),
                ]),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LogIn(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login Here',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addUserDetails() async {
    UserModelDetails userModelDetails = UserModelDetails();
    userModelDetails.name = nameController.text;
    userModelDetails.email = emailController.text;
    userModelDetails.password = passwordController.text;
    userModelDetails.userType = selectedUserType;

    int result = await DatabaseHelperInfo().insertUserDetails(userModelDetails);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LogIn(),
      ),
    );
  }
}
