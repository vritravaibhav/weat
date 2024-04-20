// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:yuktidea/Screens/get_otp_scree.dart';
import 'package:yuktidea/widget/buttonyu.dart';
import 'package:http/http.dart' as http;

class GetPhoneNumber extends StatefulWidget {
  final String country;
  final String code;
  final String user;
  const GetPhoneNumber({
    Key? key,
    required this.country,
    required this.code,
    required this.user,
  }) : super(key: key);

  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  TextEditingController _phoneNumber = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var response;
  Future<void> regis() async {
    // FormData formData = new FormData.fromMap(
    //     {"tel_code": widget.code, "phone": _phoneNumber.text});
    // response = await Dio().post(
    //   "https://studylancer.yuktidea.com/api/${widget.user}/login",
    //   data: formData,
    //   options: Options(headers: {
    //     HttpHeaders.contentTypeHeader: "application/json",
    //   }),
    // );
    print(widget.code);
    print(widget.user);
    print(_phoneNumber.text);
    response = await http.post(
      Uri.parse("https://studylancer.yuktidea.com/api/resend-otp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "phone": _phoneNumber.text,
        // Add any other data you want to send in the body
      }),
    );
    // var headers = {'Accept': 'application/json'};
    // var request = http.MultipartRequest('POST',
    //     Uri.parse('https://studylancer.yuktidea.com/api/student/login'));
    // request.fields.addAll({'tel_code': '+91', 'phone': _phoneNumber.text});

    // request.headers.addAll(headers);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }
    // print(await response.stream.bytesToString());

    // print(response.body);
    // print((jsonDecode(response)));
    //  print(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

        // body: Image.network("https://flagcdn.com/al.svg")
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
                      onPressed: () {},
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
                "Enter phone number",
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
                    "Please enter your 10 digit mobile number to receive OTP",
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
                height: 60.h,
              ),
              Container(
                width: 265.w,
                height: 57.h,
                child: TextFormField(
                  validator: (value) {},
                  onChanged: (val) {
                    setState(() {});
                  },
                  controller: _phoneNumber,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp,
                      height: 27.h / 18.sp),
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(0),
                    hintText: "999999999",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Color(0xff656366),
                        height: 27.h / 18.sp),
                    prefixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.network(
                          widget.country,
                          placeholderBuilder: (BuildContext context) =>
                              CircularProgressIndicator(),
                          height: 20.h, // Adjust height as needed
                          width: 30.w, // Adjust width as needed
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Text(
                          widget.code,
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              height: 27.h / 18.sp),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 236.h,
              ),
              _phoneNumber.text == ""
                  ? ButtonYu("Get OTP", false, () {})
                  : ButtonYu("Get OTP", true, () async {
                      await regis();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return GetOTP();
                      }));
                    })
            ],
          ),
        ));
  }
}
