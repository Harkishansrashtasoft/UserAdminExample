import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:user_admin_example/product_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, this.productModel}) : super(key: key);

  ProductModel? productModel;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentPos = 0;
  List<ProductModel> productList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product Detail Page'),
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.file(
                      File(widget.productModel!.image1!),
                      width: MediaQuery.of(context).size.width * 0.180,
                      height: MediaQuery.of(context).size.height * 0.110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.file(
                      File(widget.productModel!.image2!),
                      width: MediaQuery.of(context).size.width * 0.180,
                      height: MediaQuery.of(context).size.height * 0.110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.file(
                      File(widget.productModel!.image3!),
                      width: MediaQuery.of(context).size.width * 0.180,
                      height: MediaQuery.of(context).size.height * 0.110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.file(
                      File(widget.productModel!.image4!),
                      width: MediaQuery.of(context).size.width * 0.180,
                      height: MediaQuery.of(context).size.height * 0.110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Image.file(
                      File(widget.productModel!.image5!),
                      width: MediaQuery.of(context).size.width * 0.180,
                      height: MediaQuery.of(context).size.height * 0.110,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 300),
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                height: 75,
                color: Colors.blue.shade50,
                child: Column(
                  children: [
                    ListTile(
                      leading: CachedNetworkImage(
                        height: 70,
                        width: 100,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        imageUrl:
                            'https://www.cashadvance6online.com/data/archive/img/2597584230.png',
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Inspect Features in 360',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              size: 18, color: Colors.blue)
                        ],
                      ),
                      subtitle: Text(
                        'Check how this looks from all angles',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(
                        Icons.info,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Select Variant',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.color_lens_rounded,
                          size: 18, color: Colors.blue),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Color : ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              widget.productModel!.mobileColor!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            '2 More',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      ),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.sd_card, size: 18, color: Colors.blue),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Storage : ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              widget.productModel!.mobileStorage!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            '2 More',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      ),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.segment, size: 18, color: Colors.blue),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Ram : ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: Text(
                              widget.productModel!.mobileRam!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            '2 More',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 4,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Text(
                      "${widget.productModel!.mobileName!} (${widget.productModel!.mobileColor!},${widget.productModel!.mobileStorage!}) (${widget.productModel!.mobileRam!})",
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 16,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Divider(
                color: Colors.grey.shade300,
                thickness: 4,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Highlights',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.search, color: Colors.black),
                          Text(
                            'Search',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.memory, size: 30, color: Colors.grey),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'RAM',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 15,
                                width: 2,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'ROM',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "${widget.productModel!.mobileRam!} RAM",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 15,
                            width: 2,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.productModel!.mobileStorage!} ROM",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.memory, size: 30, color: Colors.grey),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Processor',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: const [
                          Text(
                            "MediaTek Helio G95",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.camera_alt_outlined,
                          size: 30, color: Colors.grey),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Rear Camera',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: const [
                          Text(
                            "48MP + 2MP + 2MP",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.camera, size: 30, color: Colors.grey),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Front Camera',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: const [
                          Text(
                            "16MP",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone_android_outlined,
                          size: 30, color: Colors.grey),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Display',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "${widget.productModel!.mobileSize!} Full HD+ ${widget.productModel!.mobileScreen!} in-Cell Display",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.battery_alert,
                          size: 30, color: Colors.grey),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Battery',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: const [
                          Text(
                            "5000 mAh",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Divider(
                color: Colors.grey.shade300,
                thickness: 4,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Other Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const Text(
                            'Network Type',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            widget.productModel!.mobileNetworkType!,
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            'Sim Type',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            widget.productModel!.mobileSimType!,
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            'Expandable Storage',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            'Yes',
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            'Audio Jack',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            'Quick Charging',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            "No",
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Warranty',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            'Warranty Summary',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            "${widget.productModel!.mobileWarranty!} Warranty for Mobile and 6 month for accessories",
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
