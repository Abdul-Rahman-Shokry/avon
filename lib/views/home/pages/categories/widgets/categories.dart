part of '../view.dart';

class _Categories extends StatefulWidget {
  const _Categories({super.key});

  @override
  State<_Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<_Categories> {
  List<CategoryItemModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get(
      "https://cosmatics.growfet.com/api/Categories",
    );
    list = CategoriesData.fromJson({"list": resp.data}).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return list == null
        ? CircularProgressIndicator()
        : ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: 13.w,
              vertical: 30.h,
            ).copyWith(bottom: 100.h),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list!.length,
            itemBuilder: (context, index) => SizedBox(
              width: 65.w,
              height: 65.h,
              child: _Item(model: list![index]),
            ),
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: Divider(),
            ),
          );
  }
}

class CategoriesData {
  late final List<CategoryItemModel> list;

  CategoriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CategoryItemModel.fromJson(e)).toList();
  }
}

class CategoryItemModel {
  late final int id;
  late final String titleEn;
  late final String titleAr;
  late final String imageUrl;

  CategoryItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    imageUrl = json['image_url'];
  }
}
