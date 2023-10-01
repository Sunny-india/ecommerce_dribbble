import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color_constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: CircleAvatar(
            backgroundColor: ColorConstants.textFormFieldIconColor,
            child: IconButton(
              iconSize: 30,
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(CupertinoIcons.back),
            ),
          ),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Mulish-Italic',
              fontWeight: FontWeight.w700,
              fontSize: 26),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 17,
                    child: buildImageContainer(index),
                  ),
                  Expanded(flex: 40, child: buildDetailContainer()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container buildImageContainer(int index) {
    return Container(
      height: 110,
      width: 75,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: ColorConstants.roundContainerColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Image(
          image: AssetImage(images[index]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container buildDetailContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      height: 110,
      width: 75,
      child: Column(
        children: [
          /// row for item name, inside detail, and delete button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Women Sweater',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(color: Colors.black12, fontSize: 15),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.delete,
                  color: CupertinoColors.destructiveRed,
                ),
              ),
            ],
          ),

          /// row for item name, inside detail, and delete button ends here

          const SizedBox(height: 14),

          /// row for prices and quantity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$70.00',
                style: TextStyle(fontSize: 23),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: ColorConstants.backgroundColor),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.minus,
                      ),
                    ),
                    const Text(
                      '1',
                      style: TextStyle(fontSize: 23),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.plus,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// row for prices and quantity ends here
        ],
      ),
    );
  }
}
