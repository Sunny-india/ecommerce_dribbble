import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_constants.dart';

class ProductDetailModelPage extends StatefulWidget {
  const ProductDetailModelPage({super.key});

  @override
  State<ProductDetailModelPage> createState() => _ProductDetailModelPageState();
}

class _ProductDetailModelPageState extends State<ProductDetailModelPage> {
  List<String> images = [
    'assets/images/shoe1.jpeg',
    'assets/images/shoe2.jpeg',
    'assets/images/shoe3.webp',
    'assets/images/shoe1.jpeg',
    'assets/images/shoe2.jpeg',
    'assets/images/shoe3.webp'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ColorConstants.roundContainerColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: size.height * .5,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    border: Border.all(color: CupertinoColors.black)),
                child: PageView.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image(
                          image: AssetImage(
                            images[index].toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
