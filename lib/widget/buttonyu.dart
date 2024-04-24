import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ButtonYu(String textt, bool flag, Function() x) {
  return Row(
    children: [
      Expanded(child: SizedBox()),
      InkWell(
        onTap: x,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF212426),
                  Color(0xFF212426),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(6, 6),
                  blurRadius: 12,
                ),
                BoxShadow(
                  color: Color(0x0AFFFFFF),
                  offset: Offset(-6, -6),
                  blurRadius: 12,
                ),
              ],
              border: Border.all(
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 2,
                  color: Color(0x05FFFFFF)),
              borderRadius: BorderRadius.circular(100.r)),
          child: Container(
            height: 59.h,
            // width: 214.w,
            // constraints: BoxConstraints(maxWidth: 300),
            padding: EdgeInsets.only(left: 70.w, right: 70.w),
            decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.multiply,
                // color: Color(0xff212426),

                //   boxShadow: [
                // BoxShadow(
                //   blurStyle: BlurStyle.solid,
                //   offset: Offset(6, 6),
                //   blurRadius: 1,
                //   spreadRadius: 0,
                //   color: Color(0x29000000),
                // ),
                // BoxShadow(
                //   blurStyle: BlurStyle.solid,
                //   offset: Offset(-6, -6),
                //   blurRadius: 1,
                //   spreadRadius: 0,
                //   color: Color(0x0AFFFFFF),
                // ),
                // BoxShadow(
                //   color: Color(0x29000000),
                //   offset: Offset(6, 6),
                //   blurRadius: 4,
                // ),
                // BoxShadow(
                //   color: Color(0x0AFFFFFF),
                //   offset: Offset(-6, -6),
                //   blurRadius: 4,
                // ),
                // ],
                gradient: LinearGradient(
                  //  colors: [Color(0x1F000000), Color(0x00000000)],
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.12),
                    Colors.transparent,
                  ],
                ),

                border: Border.all(
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    width: 2,
                    color: Color(0x05FFFFFF)),
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
      ),
      Expanded(child: SizedBox()),
    ],
  );
}
