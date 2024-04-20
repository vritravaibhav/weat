import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  void initState() {
    getHttp();
    super.initState();
  }

  String? mohan;
  bool isLoaded = false;
  // Widget html =
  var response;
  var responsedata;
  void getHttp() async {
    print("good");
    response = await Dio()
        .get("https://studylancer.yuktidea.com/api/terms-conditions");
    print(response);
    // responsedata = jsonDecode(response.b);
    print(response.data["message"]);
    isLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Color(0xff212426),
              width: 375.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30.w),
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
                        onPressed: () {},
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 11,
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Image.asset(
                        "assets/hopel.png",
                        width: 55.w,
                        height: 65.h,
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Terms of Service",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Color(0xffD9896A),
                                height: 27.h / 18.sp),
                          ),
                          Text(
                            "Update 16/03/2023",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Color(0XFF7D7E80),
                                height: 21.h / 14.sp),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  SizedBox(
                      height: 590.h,
                      child: SingleChildScrollView(
                        child: Text(
                          " ${response.data["data"]["content"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Colors.white,
                              height: 18.h / 12.sp),
                        ),
                      )),
                  // Html(
                  //   data: response.data["data"]["content"],
                  // ),
                ],
              ),
            ),
    );
  }
}
