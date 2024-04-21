import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuktidea/Screens/startup_screen.dart';
import 'package:yuktidea/widget/buttonyu.dart';
import 'package:yuktidea/widget/constants.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var response;
  Future<bool> _apiCall() async {
    response = await http.post(
      Uri.parse("https://studylancer.yuktidea.com/api/delete"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    response = jsonDecode(response.body);
    if (response["status"] == false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response["message"])));

      return false;
    }
    token = "lol";

    security().set();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff212426),
        width: 375.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xffFFFFFF),
                  fontSize: 24.sp,
                  height: 36.h / 24.sp),
            ),
            SizedBox(
              height: 36.sp,
            ),
            ButtonYu("Logout", true, () => null),
            SizedBox(
              height: 36.h,
            ),
            ButtonYu("Delete User", true, () async {
              if (await _apiCall()) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StartupScreen();
                }));
              }
            })

            //InkWell(
            //   onTap: (){},
            //   child: Container(
            //     height: 59.h,
            //     width: 214.w,
            //     decoration: BoxDecoration(
            //         //color: Color(0xff212426),
            //         boxShadow: [
            //           BoxShadow(
            //             offset: Offset(-6, -6),
            //             blurRadius: 12.r,
            //             spreadRadius: 0,
            //             color: Color(0x0AFFFFFF),
            //           ),
            //           BoxShadow(
            //             offset: Offset(6, 6),
            //             blurRadius: 12.r,
            //             spreadRadius: 0,
            //             color: Color(0x29000000),
            //           ),
            //         ],
            //         gradient: LinearGradient(
            //           colors: [
            //             Color.fromARGB(
            //               0.12.toInt(),
            //               0,
            //               0,
            //               0,
            //             ), // #000000 with 12% opacity
            //             // #000000 with 0% opacity
            //             Color.fromARGB(
            //               0,
            //               0,
            //               0,
            //               0,
            //             ) //
            //           ],
            //         ),
            //         // color: Color(0xff212426),
            //         //  color: Colors.white,
            //         border:
            //             Border.all(width: 2, color: Color(0xffFFFFFF).withOpacity(0.10)),
            //         borderRadius: BorderRadius.circular(100.r)),
            //     child: Center(
            //         child: Text(
            //       "Delete User",
            //       style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 18.sp,
            //           color:
            //              Color(0xffF9D3B4) ,
            //           height: 27.h / 18.sp),
            //     )),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
