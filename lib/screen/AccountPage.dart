import 'dart:ui';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:trungtamthethao/Widget/Account_appbar.dart';
import 'package:trungtamthethao/Widget/home_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trungtamthethao/account/login.dart';
import '../Style/app_styles.dart';
 // Import the Login page

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: AccountAppbar(),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      image: AssetImage('assets/account2.jpg'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Gap(10),
                Text(
                  "Long Huỳnh",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "longhuynh061@gmail.com",
                  style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Icon(Icons.person, size: 30),
                    ),
                    Container(
                      width: 340,
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Chi tiết người dùng",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    Icon(Icons.navigate_next, size: 30, color: Colors.grey),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Icon(Icons.settings, size: 30),
                    ),
                    Container(
                      width: 340,
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Cài đặt",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    Icon(Icons.navigate_next, size: 30, color: Colors.grey),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Icon(Icons.payment, size: 30),
                    ),
                    Container(
                      width: 340,
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Chi tiết Thanh Toán",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    Icon(Icons.navigate_next, size: 30, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
          Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Log out logic here
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Text(
                'Đăng xuất',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
