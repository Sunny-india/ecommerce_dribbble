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
              child: buildSizedBoxWithPageView(size),
            ),
            Positioned(
              top: size.height * .45,
              left: size.width * .25,
              child: buildRowForPageControllingDots(),
            ),
            Positioned(
              //todo: how to set width and height when landscape in all widgets
              top: size.height * .5,
              child: buildDownContainer(size),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBoxWithPageView(Size size) {
    return SizedBox(
      height: size.height * .5,
      width: size.width,
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
            return Image(
              image: AssetImage(
                images[index % images.length].toString(),
              ),
              fit: BoxFit.cover,
            );
          }),
    );
  }

  Row buildRowForPageControllingDots() {
    return Row(
      children: List.generate(images.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: InkWell(
            onTap: () {
              pageController.jumpToPage(index);
            },
            child: Container(
              width: 24,
              height: 12,
              decoration: BoxDecoration(
                borderRadius:
                    pageNumber == index ? BorderRadius.circular(12) : null,
                shape:
                    pageNumber == index ? BoxShape.rectangle : BoxShape.circle,
                color: pageNumber == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        );
      }),
    );
  }

  Container buildDownContainer(Size size) {
    return Container(
      height: size.height * .5,
      width: size.width,
      color: Colors.red,
      child: Column(),
    );
  }
}
