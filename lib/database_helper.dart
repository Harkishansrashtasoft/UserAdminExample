import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:user_admin_example/product_model.dart';
import 'package:user_admin_example/usermodel.dart';

class DatabaseHelperInfo {
  String userInfoTableName = "USERDETAILS";
  String productsInfoTableName = "PRODUCTDETAILS";

  Future<Database> getDatabase() async {
    String path = await getDatabasesPath();

    String dbPath = join(path, "UserDetailsData.db");
    Database database = await openDatabase(
      dbPath,
      version: 7,
      onCreate: (db, version) {
        db
            .execute(
                "create table $userInfoTableName (id integer primary key autoincrement,name text,email text, password text,userType text);")
            .catchError((error) {
          debugPrint("ERROR:- $error");
        });

        db
            .execute(
                "create table $productsInfoTableName (id integer primary key autoincrement,image1 text,image2 text,image3 text,image4 text,image5 text,mobileName text,mobileDescription text,mobilePrice text,mobileWarranty text,mobileRam text, mobileSize text, mobileModelNumber text, mobileColor text, mobileSimType text, mobileScreen text,mobileNetworkType text,mobileStorage text);")
            .catchError((error) {
          debugPrint("ERROR:- $error");
        });
      },
    );
    return database;
  }

  // user information insert
  Future<int> insertUserDetails(UserModelDetails userModelDetails) async {
    Database database = await getDatabase();

    int result =
        await database.insert(userInfoTableName, userModelDetails.toJson());
    ConflictAlgorithm.ignore;
    return result;
  }

  // product information insert
  Future<int> insertProductDetails(ProductModel productModel) async {
    Database database = await getDatabase();

    int result =
        await database.insert(productsInfoTableName, productModel.toJson());
    ConflictAlgorithm.ignore;
    return result;
  }

  // check user login validation
  Future<UserModelDetails?> getLoginUser(String email, String password) async {
    var dbClient = await getDatabase();
    var res = await dbClient.query(userInfoTableName,
        where: "email = ? and password = ?", whereArgs: [email, password]);

    if (res.length > 0) {
      return UserModelDetails.fromJson(res.first);
    }

    return null;
  }

  // get all products
  Future<List<ProductModel>> getAllProductList() async {
    Database database = await getDatabase();
    List<Map> result = await database.query(
      productsInfoTableName,
    );
    List<ProductModel> productList = [];
    result.forEach((element) {
      ProductModel productModel = ProductModel.fromJson(element);
      productList.add(productModel);
    });
    return productList;
  }

  // get all users
  Future<List<UserModelDetails>> getAllUserList() async {
    Database database = await getDatabase();
    List<Map> result = await database.query(
      userInfoTableName,
    );
    List<UserModelDetails> userModelDetailsList = [];
    result.forEach((element) {
      UserModelDetails userModelDetails = UserModelDetails.fromJson(element);
      userModelDetailsList.add(userModelDetails);
    });
    return userModelDetailsList;
  }

  // delete user from admin part
  Future<int> deleteUsers(UserModelDetails userModelDetails) async {
    Database database = await getDatabase();
    int result = await database.delete(userInfoTableName,
        where: "id = ?", whereArgs: [userModelDetails.id]);
    return result;
  }

  // delete products from admin part
  Future<int> deleteProducts(ProductModel productModel) async {
    Database database = await getDatabase();
    int result = await database.delete(productsInfoTableName,
        where: "id = ?", whereArgs: [productModel.id]);
    return result;
  }

  // update user details
  Future<int> updateUserDetails(UserModelDetails userModelDetails) async {
    Database database = await getDatabase();
    int result = await database.update(
        userInfoTableName, userModelDetails.toJson(),
        where: "id = ?", whereArgs: [userModelDetails.id]);
    return result;
  }

  // update product details
  Future<int> updateProductDetails(ProductModel productModel) async {
    Database database = await getDatabase();
    int result = await database.update(
        productsInfoTableName, productModel.toJson(),
        where: "id = ?", whereArgs: [productModel.id]);
    return result;
  }
}
