import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_admin_example/database_helper.dart';
import 'package:user_admin_example/product_model.dart';

enum ImageSourceType { gallery, camera }

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key, this.type}) : super(key: key);
  final type;

  @override
  _AddProductPageState createState() => _AddProductPageState(this.type);
}

class _AddProductPageState extends State<AddProductPage> {
  // for all controller
  TextEditingController mobileNameController = TextEditingController();
  TextEditingController mobileDescController = TextEditingController();
  TextEditingController mobilePriceController = TextEditingController();
  TextEditingController mobileWarrantyController = TextEditingController();
  TextEditingController mobileRamController = TextEditingController();
  TextEditingController mobileSizeController = TextEditingController();
  TextEditingController mobileModelNumberController = TextEditingController();
  TextEditingController mobileColorController = TextEditingController();
  TextEditingController mobileStorageController = TextEditingController();

  // mobile screen type
  String mobileScreenTypeValue = "LCD";

  // mobile sim type
  String mobileSimTypeValue = "Dual";

  // mobile sim type
  String mobileNetworkTypeValue = "2G";

  // for imagepicker
  ImagePicker imagePicker = ImagePicker();
  var type;
  late Future<File> imageFile;
  String? pickedImage1;
  String? pickedImage2;
  String? pickedImage3;
  String? pickedImage4;
  String? pickedImage5;

  late File imageFileReturn;

  _AddProductPageState(this.type);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Add product page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Container(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  direction: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        var source = type == ImageSourceType.camera
                            ? ImageSource.camera
                            : ImageSource.gallery;
                        XFile? image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          pickedImage1 = image?.path;
                        });
                      },
                      child: Container(
                        color: Colors.lightBlue,
                        height: 100.0,
                        width: 100.0,
                        child: pickedImage1 != null
                            ? Image.file(
                                File(pickedImage1!),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration:
                                    BoxDecoration(color: Colors.blue[400]),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var source = type == ImageSourceType.camera
                            ? ImageSource.camera
                            : ImageSource.gallery;
                        XFile? image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          pickedImage2 = image?.path;
                        });
                      },
                      child: Container(
                        color: Colors.lightBlue,
                        height: 100.0,
                        width: 100.0,
                        child: pickedImage2 != null
                            ? Image.file(
                                File(pickedImage2!),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration:
                                    BoxDecoration(color: Colors.blue[400]),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var source = type == ImageSourceType.camera
                            ? ImageSource.camera
                            : ImageSource.gallery;
                        XFile? image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          pickedImage3 = image?.path;
                        });
                      },
                      child: Container(
                        color: Colors.lightBlue,
                        height: 100.0,
                        width: 100.0,
                        child: pickedImage3 != null
                            ? Image.file(
                                File(pickedImage3!),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration:
                                    BoxDecoration(color: Colors.blue[400]),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var source = type == ImageSourceType.camera
                            ? ImageSource.camera
                            : ImageSource.gallery;
                        XFile? image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          pickedImage4 = image?.path;
                        });
                      },
                      child: Container(
                        color: Colors.lightBlue,
                        height: 100.0,
                        width: 100.0,
                        child: pickedImage4 != null
                            ? Image.file(
                                File(pickedImage4!),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration:
                                    BoxDecoration(color: Colors.blue[400]),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var source = type == ImageSourceType.camera
                            ? ImageSource.camera
                            : ImageSource.gallery;
                        XFile? image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            preferredCameraDevice: CameraDevice.front);
                        setState(() {
                          pickedImage5 = image?.path;
                        });
                      },
                      child: Container(
                        color: Colors.lightBlue,
                        height: 100.0,
                        width: 100.0,
                        child: pickedImage5 != null
                            ? Image.file(
                                File(pickedImage5!),
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.fill,
                              )
                            : Container(
                                decoration:
                                    BoxDecoration(color: Colors.blue[400]),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.grey[800],
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              TextFormField(
                controller: mobileNameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile name',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobileDescController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Description',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobilePriceController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Price',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobileWarrantyController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Warranty',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobileRamController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Ram',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobileSizeController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Size in inch',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobileModelNumberController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Model number',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobileColorController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Color',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        errorStyle: const TextStyle(
                            color: Colors.redAccent, fontSize: 16.0),
                        labelText: 'Please select Sim type',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: mobileSimTypeValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            mobileSimTypeValue = newValue!;
                          });
                        },
                        items: <String>['Single', 'Dual']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        errorStyle: const TextStyle(
                            color: Colors.redAccent, fontSize: 16.0),
                        labelText: 'Please select Screen type',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: mobileScreenTypeValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            mobileScreenTypeValue = newValue!;
                          });
                        },
                        items: <String>['LCD', 'LED', 'OLED']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        errorStyle: const TextStyle(
                            color: Colors.redAccent, fontSize: 16.0),
                        labelText: 'Please select Network type',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: mobileNetworkTypeValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            mobileNetworkTypeValue = newValue!;
                          });
                        },
                        items: <String>['2G', '3G', '4G']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: mobileStorageController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                autocorrect: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Storage',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ElevatedButton(
                onPressed: () async {
                  addProductDetails();
                },
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void addProductDetails() async {
    ProductModel productModel = ProductModel();
    productModel.image1 = pickedImage1!;
    productModel.image2 = pickedImage2!;
    productModel.image3 = pickedImage3!;
    productModel.image4 = pickedImage4!;
    productModel.image5 = pickedImage5!;
    productModel.mobileName = mobileNameController.text;
    productModel.mobileDescription = mobileDescController.text;
    productModel.mobilePrice = mobilePriceController.text;
    productModel.mobileWarranty = mobileWarrantyController.text;
    productModel.mobileRam = mobileRamController.text;
    productModel.mobileSize = mobileSizeController.text;
    productModel.mobileModelNumber = mobileModelNumberController.text;
    productModel.mobileColor = mobileColorController.text;
    productModel.mobileSimType = mobileSimTypeValue;
    productModel.mobileScreen = mobileScreenTypeValue;
    productModel.mobileStorage = mobileStorageController.text;
    productModel.mobileNetworkType = mobileNetworkTypeValue;

    int result = await DatabaseHelperInfo().insertProductDetails(productModel);
    Navigator.pop(context);
  }
}
