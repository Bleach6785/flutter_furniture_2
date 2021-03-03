import 'package:flutter/material.dart';
import 'package:flutter_furniture_2/custom_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "What item are you looking for?",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(26.0),
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
          // Expanded(
          //   child: GridView.builder(
          //     gridDelegate:
          //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //     itemBuilder: null,
          //   ),
          // ),
        ],
      ),
    );
  }
}
