import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_constants.dart';

class ProductDetailModelPage extends StatefulWidget {
  const ProductDetailModelPage({super.key});

  @override
  State<ProductDetailModelPage> createState() => _ProductDetailModelPageState();
}

class _ProductDetailModelPageState extends State<ProductDetailModelPage>
    with TickerProviderStateMixin {
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
  List<Color> itemColorList = const <Color>[
    Color(0xff901f30),
    Color(0xff1d4491),
    Color(0xff151515),
    Color(0xff8f471d),
    Color(0xffd8d6d7),
  ];
  late int recentTappedTab;
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

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
              top: size.height * .36,
              left: size.width * .25,
              child: buildRowForPageControllingDots(),
            ),
            Positioned(
              //todo: how to set width and height when landscape in all widgets
              top: size.height * .38,
              child: buildDownContainer(size, tabController),
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBarContainer(size),
    );
  }

  SizedBox buildSizedBoxWithPageView(Size size) {
    return SizedBox(
      height: size.height * .35,
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

  //
  SizedBox buildDownContainer(Size size, TabController tabController) {
    return SizedBox(
      height: size.height * .38,
      width: size.width,
      //color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Wireless Headphone\n\$520.00',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Mulish-Italic'),
              ),
              const SizedBox(height: 12),
              buildRowInRow(),
              const SizedBox(height: 8),
              const Text(
                'Color',
                style: TextStyle(
                    fontFamily: 'Mulish-Italic',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              const SizedBox(height: 7),
              // color chooser
              SizedBox(
                width: size.width * .55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(itemColorList.length, (index) {
                    return CircleAvatar(
                      backgroundColor: itemColorList[index],
                      radius: 16,
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8),
              buildTabBarInColumn(size, tabController),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowInRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: ColorConstants.orangeContainer),
              child: buildOrangeContainerRow(),
            ),
            const SizedBox(width: 4),
            Text(
              '(320 Reviews)',
              style: TextStyle(
                  color: ColorConstants.textFormFieldIconColor, fontSize: 20),
            ),
          ],
        ),
        const Row(
          //todo: how to  use RichTextSpan
          // todo: how to make it work on different devices?
          children: [
            // Text(
            //   'Seller: ',
            //   style: TextStyle(color: Colors.black, fontSize: 20),
            // ),
            Text(
              'Tariqual Islam',
              style: TextStyle(color: Colors.black, fontSize: 16),
            )
          ],
        ),
      ],
    );
  }

  Row buildOrangeContainerRow() {
    return const Row(
      children: [
        Icon(
          CupertinoIcons.star,
          color: Colors.white,
          size: 25,
        ),
        SizedBox(width: 4),
        Text(
          '4.8',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }

  SizedBox buildTabBarInColumn(Size size, TabController tabController) {
    return SizedBox(
      height: size.height * .55,
      child: Column(
        children: [
          TabBar(
              labelStyle: TextStyle(
                  fontSize: size.width * .035, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.black,
              controller: tabController,
              indicator: BoxDecoration(
                  color: ColorConstants.orangeContainer,
                  borderRadius: BorderRadius.circular(12)),
              tabs: const [
                Tab(
                    child: Text(
                  'Description',
                )),
                Tab(child: Text('Specification')),
                Tab(child: Text('Reviews')),
              ]),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                descriptionText(),
                specificationText(),
                reviewText(),
              ],
            ),
          ),
        ],
      ),
    );
  } // ends build function here

  Text descriptionText() {
    return Text('Description Text');
  } // ends descriptionText here

  Text specificationText() {
    return Text('Specification Text');
  } // ends specificationText here;

  Text reviewText() {
    return Text('Review Text');
  } // ends reviewText here;

  Container buildBottomNavigationBarContainer(Size size) {
    return Container(
      height: size.height * .08,
      margin: EdgeInsets.only(
        bottom: size.height * .03,
        left: size.width * .03,
        right: size.width * .03,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26), color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //container for increasing and decreasing items
          Expanded(
            flex: 3,
            child: Container(
              constraints: const BoxConstraints(minHeight: 70),
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: Colors.white),
                //color: Colors.black12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.minus,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.plus,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: ColorConstants.orangeContainer,
              ),
              child: MaterialButton(
                textColor: Colors.white,
                onPressed: () {},
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

//
} // ends class here
