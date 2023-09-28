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
  int pageNumber = 0;
  PageController pageController = PageController();
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
                // decoration: BoxDecoration(
                //     borderRadius: const BorderRadius.only(
                //       bottomLeft: Radius.circular(12),
                //       bottomRight: Radius.circular(12),
                //     ),
                //     border: Border.all(color: CupertinoColors.black)),
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    itemCount: images.length,
                    onPageChanged: (int changedPage) {
                      setState(() {
                        pageNumber = changedPage;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image(
                          image: AssetImage(
                            images[index % images.length].toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
              ),
            ),
            Positioned(
              top: size.height * .55,
              left: size.width * .25,
              child: Row(
                children: List.generate(images.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: InkWell(
                      onTap: () {
                        pageController.jumpToPage(index);
                      },
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor:
                            pageNumber == index ? Colors.amber : Colors.teal,
                      ),
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
