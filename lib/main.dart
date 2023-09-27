import 'package:ecommerce_dribbble/color_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchController = TextEditingController();
  List<String> shoeImages = [
    'assets/images/shoe1.jpeg',
    'assets/images/shoe2.jpeg',
    'assets/images/shoe3.webp'
  ];

  List<Map<String, dynamic>> categoryList = [
    {
      'image': 'assets/images/shoe1.jpeg',
      'name': 'shoe',
    },
    {
      'image': 'assets/images/shoe2.jpeg',
      'name': 'Beauty',
    },
    {
      'image': 'assets/images/shoe3.webp',
      'name': 'Women\'s fashion',
    },
    {
      'image': 'assets/images/shoe1.jpeg',
      'name': 'Jewellery',
    },
    {
      'image': 'assets/images/shoe2.jpeg',
      'name': 'Men\'s Fashion',
    },
    {
      'image': 'assets/images/shoe3.webp',
      'name': 'Kid\'s fashion',
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            const SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // margin: const EdgeInsets.only(left: 8),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorConstants.roundContainerColor,
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: IconButton(
                      iconSize: 36,
                      onPressed: () {},
                      //todo: could not find that icon from dribbble.com/shots/22047333-Ecommerce-Mobile-App-UI-UX-Design
                      icon: Icon(
                        Icons.apps,
                        color: ColorConstants.iconColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorConstants.roundContainerColor,
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: IconButton(
                      iconSize: 36,
                      onPressed: () {},
                      //todo: could not find that icon from dribbble.com/shots/22047333-Ecommerce-Mobile-App-UI-UX-Design
                      icon: Icon(
                        Icons.alarm,
                        color: ColorConstants.iconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // toolbarHeight: 20,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConstants.roundContainerColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide.none),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        iconSize: 36,
                        icon: Icon(
                          Icons.search,
                          color: ColorConstants.textFormFieldIconColor,
                        ),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          iconSize: 36,
                          //todo: could not find that icon from the source

                          icon: Icon(Icons.line_axis,
                              color: ColorConstants.textFormFieldIconColor))),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * .25,
                  child: buildImageListView(size),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * .159,
                  child: buildCircleListView(size),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Special For You',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Container(
                  child: buildGridView(size),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView buildGridView(Size size) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 4),
        itemBuilder: (context, index) {
          return Container(
            height: size.height * .3,
            decoration: BoxDecoration(
                color: ColorConstants.textFormFieldIconColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(12)),
          );
        });
  }

  ListView buildCircleListView(size) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage:
                      AssetImage(categoryList[index]['image'].toString()),
                ),
                const SizedBox(height: 4),
                Text(categoryList[index]['name']),
              ],
            ),
          );
        });
  }

  ListView buildImageListView(Size size) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shoeImages.length,
        itemBuilder: (context, index) {
          return Container(
            height: size.height * .25,
            width: size.width * .85,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                //todo: how to set both, the image, and color
                color: ColorConstants.roundContainerColor,
                image: DecorationImage(
                    image: AssetImage(
                      shoeImages[index].toString(),
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(22)),
          );
        });
  }
}
