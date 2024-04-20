import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ButtonYu(String textt, bool flag, Function() x) {
  return Row(
    children: [
      Expanded(child: SizedBox()),
      InkWell(
        onTap: x,
        child: Container(
          height: 59.h,
          // width: 214.w,
          // constraints: BoxConstraints(maxWidth: 300),
          padding: EdgeInsets.only(left: 70.w, right: 70.w),
          decoration: BoxDecoration(
              //color: Color(0xff212426),

              boxShadow: [
                BoxShadow(
                  offset: Offset(-6, -6),
                  blurRadius: 12.r,
                  spreadRadius: 0,
                  color: Color(0x0AFFFFFF),
                ),
                BoxShadow(
                  offset: Offset(6, 6),
                  blurRadius: 12.r,
                  spreadRadius: 0,
                  color: Color(0x29000000),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(
                    0.12.toInt(),
                    0,
                    0,
                    0,
                  ), // #000000 with 12% opacity
                  // #000000 with 0% opacity
                  Color.fromARGB(
                    0,
                    0,
                    0,
                    0,
                  ) //
                ],
              ),
              // color: Color(0xff212426),
              //  color: Colors.white,
              border: Border.all(
                  width: 2, color: Color(0xffFFFFFF).withOpacity(0.10)),
              borderRadius: BorderRadius.circular(100.r)),
          child: Center(
              child: Text(
            textt,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                color: flag
                    ? Color(0xffF9D3B4)
                    : Color(0xffF9D3B4).withOpacity(0.4),
                height: 27.h / 18.sp),
          )),
        ),
      ),
      Expanded(child: SizedBox()),
    ],
  );
}
