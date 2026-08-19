part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OfferModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get("https://cosmatics.growfet.com/api/Sliders");
    list = OffersData.fromJsonList(resp.data).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return Center(child: CircularProgressIndicator());
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 320.h,
        autoPlay: true,
        aspectRatio: 364.w/320.h ,
        viewportFraction: 1
      ),
      items: List.generate(
        list!.length,
        (index) => ClipRRect(
          borderRadius: BorderRadius.circular(40.r),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppImage(
                list![index].image_url,
                width: double.infinity,
                height: 320.h,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE9DCD3).withValues(alpha: .8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${list![index].discount_percent}% OFF DISCOUNT\nCUPON CODE : ${list![index].coupon_code}",
                            style: TextStyle(
                              color: Color(0xff62322D),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          AppImage("offer.svg"),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          AppImage("offer.svg"),
                          Spacer(),
                          Text(
                            "${list![index].description_title1_en}\n${list![index].description_title2_en}",
                            style: TextStyle(
                              color: Color(0xff434C6D),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OffersData {
  late List<OfferModel> list;

  OffersData.fromJsonList(List<dynamic> jsonList) {
    list = jsonList.map((e) => OfferModel.fromJson(e)).toList();
  }
}

class OfferModel {
  late final String coupon_code,
      description_title1_en,
      description_title1_ar,
      description_title2_en,
      description_title2_ar,
      image_url;
  late final int id;
  late final num discount_percent;

  OfferModel.fromJson(Map<String, dynamic> json) {
    coupon_code = json["coupon_code"] ?? "";
    description_title1_en = json["description_title1_en"] ?? "";
    description_title1_ar = json["description_title1_ar"] ?? "";
    description_title2_en = json["description_title2_en"] ?? "";
    description_title2_ar = json["description_title2_ar"] ?? "";
    image_url = json["image_url"] ?? "";
    id = json["id"] ?? 0;
    discount_percent = json["discount_percent"] ?? 0;
  }
}
