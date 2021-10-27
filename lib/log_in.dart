import 'package:flutter/material.dart';
import 'package:user_admin_example/database_helper.dart';
import 'package:user_admin_example/home_page.dart';
import 'package:user_admin_example/usermodel.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Log in'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: Column(
              children: [
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
                ElevatedButton(
                  onPressed: () async {
                    if (emailController.text != "" &&
                        passwordController.text != "") {
                      DatabaseHelperInfo dbHelper = DatabaseHelperInfo();
                      UserModelDetails? userModelDetails =
                          await dbHelper.getLoginUser(
                              emailController.text, passwordController.text);

                      if (userModelDetails != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                HomePage(user: userModelDetails),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("user not found"),
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Login Failed"),
                      ));
                    }
                  },
                  child: Text('Log in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
