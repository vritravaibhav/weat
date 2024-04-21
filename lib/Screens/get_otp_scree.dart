// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

import 'package:yuktidea/Screens/select_country_scree.dart';
import 'package:yuktidea/widget/buttonyu.dart';
import 'package:yuktidea/widget/constants.dart';

class GetOTP extends StatefulWidget {
  const GetOTP({
    Key? key,
    required this.phone,
  }) : super(key: key);
  final String phone;

  @override
  State<GetOTP> createState() => _GetOTPState();
}

class _GetOTPState extends State<GetOTP> {
  bool validator = false;
  bool _hasData = false;
  final TextEditingController _code = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _resendOTP = false;
  late Timer _timer;
  int _start = 30;
  void startTimer() {
    // const oneSec = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_start == 0) {
          _resendOTP = !_resendOTP;
          timer.cancel();
          _start = 30;
          setState(() {});
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var response;
  Future<bool> func(BuildContext context) async {
    response = await http.post(
      Uri.parse("https://studylancer.yuktidea.com/api/verify-otp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "code": _code.text, "phone": widget.phone
        // Add any other data you want to send in the body
      }),
    );
    print(response.body);
    response = jsonDecode(response.body);
    if (response["status"] == false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response["message"])));
      validator = true;
      setState(() {});
      return false;
    }
    token = response["data"]["access_token"];
    security().set();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Image.network("https://flagcdn.com/al.svg")
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
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
                  "Verify Number",
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
                      "Please enter the OTP received to verify your number  ",
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
                Pinput(
                  controller: _code,
                  length: 4,
                  // defaultPinTheme: defaultPinTheme,
                  // focusedPinTheme: focusedPinTheme,
                  // submittedPinTheme: submittedPinTheme,
                  errorTextStyle: TextStyle(
                    height: 90.h / 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF05252),
                    fontSize: 14.sp,
                  ),
                  onCompleted: (value) {
                    setState(() {
                      validator = false;
                      setState(() {});
                      _hasData = true;
                    });
                  },

                  validator: (s) {
                    return !validator
                        ? null
                        : 'OTP does not match, please try again';
                  },
                  defaultPinTheme: PinTheme(
                      width: 30.w,
                      textStyle: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          height: 27.h / 18.sp),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xff7D7E80)),
                      ))),
                  // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  //   onCompleted: (pin) => print(pin),
                ),
                SizedBox(
                  height: 80.h,
                ),
                Text(
                  "Didn’t receive OTP?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xff7D7E80),
                    height: 21.h / 14.sp,
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                InkWell(
                    onTap: () {
                      _resendOTP = true;
                      startTimer();
                      setState(() {});
                    },
                    child: !_resendOTP
                        ? Text(
                            "Resend OTP",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                height: 27.h / 18.sp,
                                color: Color(0xffD9896A)),
                          )
                        : Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Resending OTP in ",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 27.h / 18.sp,
                                    color: Color(0xff7D7E80))),
                            TextSpan(
                                text: "$_start seconds",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 27.h / 18.sp,
                                    color: Color(0xffD9896A))),
                          ]))),
                SizedBox(
                  height: 80.h,
                ),
                ButtonYu("Verify", _hasData, () async {
                  if (_formKey.currentState!.validate()) {
                    // print("goof");
                    if (await func(context))
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SelectCountry();
                      }));
                  }
                }),
              ],
            ),
          ),
        ));
  }
}
