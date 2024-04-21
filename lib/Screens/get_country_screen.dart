// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:yuktidea/Screens/get_phone_number.dart';

class GetCountry extends StatefulWidget {
  const GetCountry({
    Key? key,
    required this.User,
  }) : super(key: key);
  final String User;

  @override
  State<GetCountry> createState() => _GetCountryState();
}

class _GetCountryState extends State<GetCountry> {
  @override
  void initState() {
    _getHttp();
    // TODO: implement initState
    super.initState();
  }

  bool isLoaded = false;

  var response;
  void _getHttp() async {
    print("great");
    response =
        await Dio().get("https://studylancer.yuktidea.com/api/countries");
    print(response);
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
              width: 375.w,
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
                    height: 19.h,
                  ),
                  Text(
                    "Select your country",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24.sp,
                        color: Color(0xffFFFFFF),
                        height: 36.h / 24.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 50.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        color: Color(0xff4B4E4F),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: TextField(
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          height: 27.h / 18.sp),
                      decoration: InputDecoration(
                          //  contentPadding: EdgeInsets.all(0),
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              height: 27.h / 18.sp),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffD9896A),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r))),
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: response.data["data"].length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CountryCard(
                            name: response.data["data"][index]["name"],
                            code: response.data["data"][index]["tel_code"],
                            imageL: response.data["data"][index]["flag"],
                            User: widget.User,
                          );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String name;
  final String code;
  final String imageL;
  final String User;
  const CountryCard({
    Key? key,
    required this.name,
    required this.code,
    required this.imageL,
    required this.User,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return GetPhoneNumber(
            code: code,
            country: imageL,
            user: User,
          );
        }));
      },
      child: Column(
        children: [
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
            height: 16.h,
          ),
          Container(
            width: 297.w,
            height: 47.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                imageL != null
                    ? SizedBox(
                        height: 22.h, // Adjust height as needed
                        width: 32.w,
                        child: SvgPicture.network(
                          imageL.toLowerCase(),
                          fit: BoxFit.fill,
                          placeholderBuilder: (BuildContext context) =>
                              CircularProgressIndicator(),
                          height: 20.h, // Adjust height as needed
                          width: 30.w,
                          // Adjust width as needed
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  name.substring(0, name.length > 12 ? 12 : name.length),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      height: 27.h / 18.sp,
                      color: Color(0xffFFFFFF)),
                ),
                Expanded(child: SizedBox()),
                Text(
                  code,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      height: 21.h / 14.sp,
                      color: Color(0xffFFFFFF)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
