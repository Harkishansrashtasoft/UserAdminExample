import 'dart:io';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_admin_example/add_product_page.dart';
import 'package:user_admin_example/database_helper.dart';
import 'package:user_admin_example/edit_product_screen.dart';
import 'package:user_admin_example/edit_profile.dart';
import 'package:user_admin_example/person_admin_list.dart';
import 'package:user_admin_example/product_detail.dart';
import 'package:user_admin_example/product_model.dart';
import 'package:user_admin_example/sign_up.dart';
import 'package:user_admin_example/usermodel.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.user});

  UserModelDetails user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> productList = [];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Home page'),
              Row(
                children: [
                  (widget.user.userType) == "admin"
                      ? IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PersonListInAdmin(
                                    userModelDetails: widget.user),
                              ),
                            );
                          },
                          icon: Icon(Icons.person),
                        )
                      : Container(),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(
                                userModelDetails: widget.user),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        // the new route
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignUp(),
                        ),

                        (Route route) => false,
                      );
                    },
                    icon: Icon(Icons.logout),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: ListView.separated(
          itemCount: productList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                  productModel: productList[index]),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              height: MediaQuery.of(context).size.height * 0.16,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.file(
                                        File(productList[index].image1!),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.180,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.110,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          productList[index].mobileName!,
                                          style: const TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.005,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 50,
                                              color: Colors.green.shade700,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    '4.4',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 12,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              '(54,376)',
                                              style: const TextStyle(
                                                  letterSpacing: 1,
                                                  fontSize: 12,
                                                  color: Colors.black54,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.005,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: '49,999',
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    color: Colors.black54),
                                              ),
                                              TextSpan(
                                                  text:
                                                      " \u20B9${productList[index].mobilePrice!}",
                                                  style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              const TextSpan(
                                                text: ' 16% off',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.005,
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Free delivery by ',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                              ),
                                              TextSpan(
                                                  text: " 26th Oct",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.005,
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'UpTo',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                              ),
                                              TextSpan(
                                                  text: " \u20B911,800",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              TextSpan(
                                                text: ' Off On Exchange',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                              alignment: Alignment.topLeft,
                              height: MediaQuery.of(context).size.height * 0.05,
                              //color: Colors.grey.shade200,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2, right: 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "${productList[index].mobileRam!} RAM",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              width: 1.5,
                                              height: 10,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "${productList[index].mobileStorage!} Storage",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.003,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade200)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 2, right: 2),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "${productList[index].mobileSize!} Full HD+ Display",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black54),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Row(
                          children: [
                            (widget.user.userType) == "admin"
                                ? IconButton(
                                    onPressed: () async {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditProductScreen(
                                                  productModel:
                                                      productList[index]),
                                        ),
                                      );

                                      getProductList();
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ))
                                : SizedBox(),
                            (widget.user.userType) == "admin"
                                ? IconButton(
                                    onPressed: () async {
                                      // await DatabaseHelperInfo()
                                      //     .deleteProducts(productList[index]);
                                      // getProductList();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext ctx) {
                                            return AlertDialog(
                                              title:
                                                  const Text('Please Confirm'),
                                              content: const Text(
                                                  'Are you sure to remove the item ?'),
                                              actions: [
                                                // The "Yes" button
                                                TextButton(
                                                    onPressed: () async {
                                                      await DatabaseHelperInfo()
                                                          .deleteProducts(
                                                              productList[
                                                                  index]);
                                                      getProductList();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Yes')),
                                                TextButton(
                                                    onPressed: () {
                                                      // Close the dialog
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('No'))
                                              ],
                                            );
                                          });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 10,
              color: Colors.grey,
            );
          },
        ),
        floatingActionButton: (widget.user.userType) == "admin"
            ? FloatingActionButton(
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddProductPage(),
                    ),
                  );
                  getProductList();
                },
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : Container(),
      ),
    );
  }

  void getProductList() async {
    debugPrint("Getting Data From Db");
    productList = await DatabaseHelperInfo().getAllProductList();
    setState(() {});
  }
}
