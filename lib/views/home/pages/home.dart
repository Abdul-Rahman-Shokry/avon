import 'package:avon/core/widgets/app_image.dart';
import 'package:avon/core/widgets/app_input.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppInput(),
                SizedBox(height: 13),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      AppImage(
                        "https://i.pinimg.com/originals/c7/72/34/c7723462882a41ebae4d3d6d874707d1.jpg",
                        width: double.infinity,
                        height: 320,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffE9DCD3).withValues(alpha: .8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "50% OFF DISCOUNT\nCUPON CODE : 125865",
                                    style: TextStyle(
                                      color: Color(0xff62322D),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  AppImage("offer.svg"),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  AppImage("offer.svg"),
                                  Spacer(),
                                  Text(
                                    "Hurry up!\nSkin care only !",
                                    style: TextStyle(
                                      color: Color(0xff434C6D),
                                      fontSize: 16,
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
                SizedBox(height: 24),
                Text(
                  "Top rated products",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 14),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 176 / 237,
                  ),
                  itemBuilder: (context, index) => _Item(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: .25),
            blurStyle: BlurStyle.outer,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AppImage(
                "frame_6.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 11),
          Text(
            "Face tint / lip tint",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xff434C6D),
            ),
          ),
          SizedBox(height: 11),
          Text(
            "\$44.99",
            style: TextStyle(
              color: Color(0xff70839C),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
