import 'package:flutter/material.dart';
import 'package:trungtamthethao/Style/app_styles.dart';
class AccountAppbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.menu,
                size: 28,
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child:  Text("Profile" ,style:  TextStyle(fontSize: 23,fontWeight:FontWeight.w500,color: Colors.black),
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child:  Text("Edit" ,style:  TextStyle(fontSize: 15,fontWeight:FontWeight.bold,color: Colors.yellow),
              ),
            ),
          )
        ],
      ),
    );
  }

}