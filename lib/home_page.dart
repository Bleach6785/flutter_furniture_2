import 'package:flutter/material.dart';
import 'package:flutter_furniture_2/custom_indicator.dart';
import 'package:flutter_furniture_2/item_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_furniture_2/product_details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Item> items;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    items = [
      Item(
        color: Color(0xFFDEE6E1),
        priceColor: Color(0xFF9DCAA4),
        name: "Roswell",
        price: "50",
        imagePath: "assets/chair1.png",
      ),
      Item(
        color: Color(0xFFE5E5E5),
        priceColor: Color(0xFF979898),
        name: "Minimal",
        price: "42",
        imagePath: "assets/chair2.png",
      ),
      Item(
        color: Color(0xFFD9DCF7),
        priceColor: Color(0xFF9BA6CA),
        name: "Lounge",
        price: "35",
        imagePath: "assets/chair3.png",
      ),
      Item(
        color: Color(0xFFEBE6E4),
        priceColor: Color(0xFFD9A7A6),
        name: "Velvet",
        price: "53",
        imagePath: "assets/chair4.png",
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container(
            //   height: ScreenUtil().setWidth(24.0),
            // ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(24.0),
                // bottom: ScreenUtil().setHeight(24.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "What item are you looking for?",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20.0),
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3D3C3C),
                        height: 1.2,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    iconSize: ScreenUtil().setSp(20.0),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            TabBar(
              controller: tabController,
              isScrollable: true,
              labelColor: Color(0xFF3D3C3C),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(18.0),
                color: Color(0xFF3D3C3C),
                height: 1.2,
              ),
              unselectedLabelColor: Color(0xFFBBBBBB),
              labelPadding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(20.0),
              ),
              indicator: CustomTabIndicator(),
              tabs: [
                Tab(
                  text: "Chairs",
                ),
                Tab(
                  text: "Sofas",
                ),
                Tab(
                  text: "Tables",
                ),
                Tab(
                  text: "Lamps",
                ),
                Tab(
                  text: "Bookshelf",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(16.0),
              ),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .77,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ItemDetails(item: items[index]),
                          ));
                    },
                    child: Hero(
                      tag: items[index].name,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(16.0),
                          vertical: ScreenUtil().setWidth(16.0),
                        ),
                        // width: ScreenUtil().setWidth(144.0),
                        // height: ScreenUtil().setHeight(250.0),
                        decoration: BoxDecoration(
                          color: items[index].color,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ScreenUtil().setHeight(30.0),
                            ),
                            Image.asset(
                              items[index].imagePath,
                              width: double.infinity,
                              height: ScreenUtil().setHeight(100.0),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(30.0),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(16.0),
                              ),
                              child: Text(
                                items[index].name,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(18.0),
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3D3C3C),
                                  height: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(12.0),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(16.0),
                              ),
                              child: Text(
                                "\$${items[index].price}",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setHeight(20.0),
                                  fontWeight: FontWeight.w700,
                                  color: items[index].priceColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(18.0),
                top: ScreenUtil().setHeight(18.0),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFE2E5FD),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.zoom_out_map,
                    color: Color(0xFF748AD5),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(14),
                  ),
                  Text(
                    "Scan My Room",
                    style: TextStyle(
                      color: Color(0xFF748AD5),
                      fontSize: ScreenUtil().setHeight(18.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
