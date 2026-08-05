import 'package:avon/core/widgets/app_back.dart';
import 'package:avon/core/widgets/app_button.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBack(), title: Text("Checkout")),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff29D3DA).withValues(alpha: .11),
            borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40.w,
                ).copyWith(top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Delivery to"),
                    SizedBox(height: 18.h),
                    _Tile(
                      leadingWidget: SizedBox(
                        width: 70.w,
                        height: 97.h,
                        child: AbsorbPointer(
                          child: GoogleMap(
                            markers: {
                              Marker(
                                markerId: MarkerId("My Location"),
                                position: LatLng(31.5121106, 31.8168448),
                              ),
                            },
                            initialCameraPosition: CameraPosition(
                              target: LatLng(31.5121106, 31.8168448),
                              zoom: 10,
                            ),
                            // liteModeEnabled: true,
                            zoomControlsEnabled: false,
                            myLocationButtonEnabled: false,
                          ),
                        ),
                      ),
                      title: "Home",
                      subTitle: "Mansoura, 14 Portsaid St",
                      bottomSpace: 40.h,
                    ),
                    Text("Payment Method"),
                    SizedBox(height: 18.h),
                    _Tile(
                      leadingImage: "mastercard.svg",
                      title: "**** **** **** 0263",
                      bottomSpace: 12.h,
                      contentPadding: 7,
                    ),
                    _Tile(
                      leadingImage: "voucher.svg",
                      title: "Add voucher",
                      trailingWidget: Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.h),
                        child: AppButton(text: "Apply"),
                      ),
                      contentPadding: 7,
                      bottomSpace: 28.h,
                    ),
                    Text("- " * 100, maxLines: 1),
                    SizedBox(height: 28.h),
                    Text("- REVIEW PAYMENT"),
                    SizedBox(height: 10.h),
                    Text(
                      "PAYMENT SUMMARY",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff434C6D),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    _DetailsText(
                      title: "Subtotal",
                      value: "Subtotal",
                      valueFontWeight1: FontWeight.w400,
                      valueFontWeight2: FontWeight.w600,
                    ),
                    _DetailsText(
                      title: "SHIPPING FEES",
                      value: "TO BE CALCULATED",
                      valueFontWeight1: FontWeight.w400,
                      valueFontWeight2: FontWeight.w600,
                    ),
                    SizedBox(height: 20.h),
                    Text("- " * 100, maxLines: 1),
                    _DetailsText(
                      title: "TOTAL + VAT",
                      value: "16.100 EGP",
                      valueFontWeight1: FontWeight.w400,
                      valueFontWeight2: FontWeight.w600,
                    ),
                    SizedBox(height: 35.h),
                    FilledButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppImage("order_checkout.svg"),
                          Text(
                            "ORDER",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final Widget? leadingWidget, trailingWidget;
  final String? leadingImage;
  final String title;
  final String? subTitle;
  final double bottomSpace;
  final double? contentPadding;

  const _Tile({
    this.leadingWidget,
    this.trailingWidget,
    this.leadingImage,
    required this.title,
    this.subTitle,
    this.bottomSpace = 0,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpace ?? 0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.5.w, color: Color(0xff73B9BB)),
          borderRadius: BorderRadius.circular(30.r),
        ),
        contentPadding: contentPadding == null
            ? EdgeInsets.all(12.r)
            : EdgeInsets.all(contentPadding!),
        horizontalTitleGap: 10.w,
        leading: leadingWidget ?? AppImage(leadingImage ?? ""),
        title: Text(title),
        subtitle: subTitle != null ? Text(subTitle!) : null,
        trailing:
            trailingWidget ??
            AppImage("arrow_down_red.svg", color: Color(0xffD75D72)),
      ),
    );
  }
}

class _DetailsText extends StatelessWidget {
  final String title, value;
  final FontWeight? valueFontWeight1;
  final FontWeight? valueFontWeight2;

  const _DetailsText({
    required this.title,
    required this.value,
    this.valueFontWeight1,
    this.valueFontWeight2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: valueFontWeight1,
            color: Color(0xff434C6D),
            fontSize: 12.sp,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: TextStyle(
            fontWeight: valueFontWeight2,
            color: Color(0xff434C6D),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
