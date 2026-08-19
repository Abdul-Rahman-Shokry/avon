part of '../view.dart';

class _Products extends StatefulWidget {
  const _Products({super.key});

  @override
  State<_Products> createState() => _ProductsState();
}

class _ProductsState extends State<_Products> {
  List<ProductModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get("https://cosmatics.growfet.com/api/Products");
    list = ProductsData.fromJson({"list": resp.data}).list;
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
        : Padding(
          padding: EdgeInsets.only(bottom: 60.h),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 176 / 237,
              ),
              itemBuilder: (context, index) => _Item(model: list![index],),
            ),
        );
  }
}

// "id": 2,
// "name_en": "Athe Red lipstick",
// "name_ar": "احمر شفاه",
// "description_en": "",
// "description_ar": "",
// "price": 60.99,
// "stock": 0,
// "image_url": "https://i.pinimg...ff8659c.jpg",
// "category_id": 6

class ProductsData {
  late final List<ProductModel> list;

  ProductsData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => ProductModel.fromJson(e)).toList();
  }
}

class ProductModel {
  late final int id;
  late final String nameEn;
  late final String nameAr;
  late final String descriptionEn;
  late final String descriptionAr;
  late final num? price;
  late final int stock;
  late final String imageUrl;
  late final int categoryId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    price = json['price'];
    stock = json['stock'];
    imageUrl = json['image_url'];
    categoryId = json['category_id'];
  }
}
