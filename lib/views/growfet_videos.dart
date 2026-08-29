import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GrowfetVideosView extends StatefulWidget {
  const GrowfetVideosView({super.key});

  @override
  State<GrowfetVideosView> createState() => _GrowfetVideosViewState();
}

class _GrowfetVideosViewState extends State<GrowfetVideosView> {
  List<VideoModel>? list;

  Future<void> getData() async {
    final resp = await Dio().get(
      "https://www.googleapis.com/drive/v3/files?q=%271m-LEUh_kP-ykn1vHNsGGjkcPOH-aPmae%27+in+parents+and+mimeType+contains+%27video%27&key=AIzaSyCK64Ze7awjzb22n7CJDIbsS6nYpLR_R0s",
    );
    list = VideosData.fromJson(resp.data).list;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Growfet Videos")),
      body: Center(
        child: list == null
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context, index) =>
                    ListTile(title: Text(list![index].name)),
                separatorBuilder: (context, index) => Divider(),
                itemCount: list!.length,
              ),
      ),
    );
  }
}

class VideosData {
  late final List<VideoModel> list;
  late final String kind;
  late final bool incompleteSearch;

  VideosData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['files'] ?? [],
    ).map((e) => VideoModel.fromJson(e)).toList();
    kind = json['kind'];
    incompleteSearch = json['incompleteSearch'];
  }
}

class VideoModel {
  late final String kind;
  late final String mimeType;
  late final String id;
  late String name;

  VideoModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] ?? "";
    mimeType = json['mimeType'] ?? "";
    id = json['id'] ?? "";
    name = json['name'] ?? "";

    final splits = name.split(".");
    splits.removeLast();
    name = splits.join("").replaceAll("_", " ");
    name = name.split(" ").map((e) => e.replaceAll(e[0], e[0].toUpperCase())).toList().join(" ");
  }
}
