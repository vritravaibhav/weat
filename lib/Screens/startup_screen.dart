import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yuktidea/Screens/get_country_screen.dart';
import 'package:yuktidea/Screens/terms_condition.dart';

class StartupScreen extends StatelessWidget {
  const StartupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 771.h,
              child: Container(
                width: 375.w,
                height: 667.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/Startup GIF 2.png"))),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              width: 375.w,
              height: 320.h,
              decoration: BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Welcome to Study Lancer",
                    textScaler: TextScaler.noScaling,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                      color: Color(0xffFFFFFF),
                      height: 36.h / 24.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Please select your role to get registered",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: Color(0xffFFFFFF),
                        height: 21.h / 14.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return GetCountry(User: 'Student',);
                          }));
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  height: 123.h,
                                  width: 158.w,
                                  "assets/Rectangle 2037.png"),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Student",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  height: 21.h / 14.sp),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return GetCountry(User: 'Agent',);
                          }));
                        },
                        child: Column(
                          children: [
                            InkWell(
                              child: Image.asset(
                                  fit: BoxFit.cover,
                                  height: 123.h,
                                  width: 158.w,
                                  "assets/Rectangle 2269.png"),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Agent",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  height: 21.h / 14.sp),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("By continuing you agree to our",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            height: 18.h / 12.sp,
                            color: Color(0xffFFFFFF))),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return TermsAndCondition();
                        }));
                      },
                      child: Text(" Terms and conditions",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              height: 18.h / 12.sp,
                              color: Color(0xffD9896A))),
                    )
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
