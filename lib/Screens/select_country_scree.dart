import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuktidea/Screens/home_screen.dart';
import 'package:yuktidea/widget/buttonyu.dart';

import 'package:http/http.dart' as http;
import 'package:yuktidea/widget/constants.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  bool australia = false;
  bool canada = false;
  bool flag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int? id = 1;
  var response;
  Future<bool> _apiCall() async {
    if (australia) {
      id = 1;
    } else {
      id = 2;
    }

    response = await http.post(
      Uri.parse("https://studylancer.yuktidea.com/api/select/country"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "country_id": id
        // Add any other data you want to send in the body
      }),
    );
    print(response.body);
    response = jsonDecode(response.body);
    if (response["status"] == false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response["message"])));

      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375.w,
        // height: 371.h,
        color: Color(0xff212426),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(left: 30.w, top: 30.h),
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Color(0xff282828),
                  // shape: BoxShape.circle,
                  // shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-4, -3),
                        blurRadius: 10,
                        spreadRadius: 0,
                        color: Color(0xffBDBDBD).withOpacity(0.3)),
                    BoxShadow(
                        offset: Offset(8, 5),
                        blurRadius: 10,
                        spreadRadius: 0,
                        color: Color(0xff000000).withOpacity(0.36)),
                  ],
                  borderRadius: BorderRadius.circular(31),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 11,
                    )),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Select country",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24.sp,
                  height: 36.h / 24.sp,
                  color: Color(0xffFFFFFF)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                width: 219.w,
                height: 42.h,
                child: Text(
                  "Please select the country where you want to study  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: Color(0xffD9896A),
                      height: 21.h / 14.sp),
                )),
            SizedBox(
              height: 27.h,
            ),
            Container(
              width: 375.w,
              height: 1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff2A2D2F).withOpacity(0),
                Color(0xff343739),
                Color(0XFF2A2D2F)
              ])),
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // canada = australia;
                        australia = true;
                        flag = true;
                        setState(() {});
                      },
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            !australia ? Colors.grey : Colors.transparent,
                            !australia ? BlendMode.saturation : BlendMode.color,
                          ),
                          child: Image.asset("assets/Mask group (1).png")),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Australia",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          height: 27.h / 18.sp,
                          color: Color(0xff7D7E80)),
                    )
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        australia = false;

                        flag = true;
                        setState(() {});
                      },
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            australia ? Colors.grey : Colors.transparent,
                            australia ? BlendMode.saturation : BlendMode.color,
                          ),
                          child: Image.asset("assets/Mask group.png")),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Canada",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          height: 27.h / 18.sp,
                          color: Color(0xff7D7E80)),
                    ),
                  ],
                )
              ],
            ),
            Expanded(child: SizedBox()),
            ButtonYu("Proceed", flag, () async {
              if (flag && await _apiCall())
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
            }),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Can’t see the country of your interest?",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  height: 18.h / 12.sp,
                  color: Color(0xffFFFFFF)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Consult with us",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  height: 27.h / 18.sp,
                  color: Color(0xffD9896A)),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
