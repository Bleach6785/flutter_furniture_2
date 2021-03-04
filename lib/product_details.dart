import 'package:flutter/material.dart';
import 'package:flutter_furniture_2/item_model.dart';
import 'package:flutter_furniture_2/state_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetails extends StatefulWidget {
  final Item item;

  const ItemDetails({Key key, this.item}) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  List<SelectorState> states;

  @override
  void initState() {
    states = [
      SelectorState(
        selected: true,
        color: Color(0xFFD9DCF7),
      ),
      SelectorState(
        selected: false,
        color: Color(0xFFFC9090),
      ),
      SelectorState(
        selected: false,
        color: Color(0xFF8ED7A6),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.item.color,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Hero(
              tag: widget.item.name,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    widget.item.imagePath,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: ScreenUtil().setWidth(24),
                    top: ScreenUtil().setHeight(56),
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: widget.item.priceColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.item.name,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                height: 1.1,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF3C3D3D),
                              ),
                            ),
                            Text(
                              "\$${widget.item.price}",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                height: 1.1,
                                fontWeight: FontWeight.w700,
                                color: widget.item.priceColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(10),
                        ),
                        Text(
                          "Chairs",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(16),
                            color: Color(0xFF9E9E9E),
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            height: 1.2,
                            color: Color(0xFF646363),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(42),
                        ),
                        Row(
                          children: [
                            selectorGen(states),
                            Row(
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(28),
                                  width: ScreenUtil().setHeight(28),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: widget.item.color,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      size: ScreenUtil().setSp(18),
                                      color: widget.item.priceColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(12),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(22),
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF3C3D3D),
                                    height: 1.2,
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(12),
                                ),
                                Container(
                                  height: ScreenUtil().setHeight(28),
                                  width: ScreenUtil().setHeight(28),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: widget.item.color,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: ScreenUtil().setSp(18),
                                      color: widget.item.priceColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
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
                          Icons.shopping_cart,
                          color: Color(0xFF748AD5),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(14),
                        ),
                        Text(
                          "Add to Cart",
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
          ),
        ],
      ),
    );
  }

  Widget selectorGen(List<SelectorState> states) {
    List<Widget> widgets = List<Widget>();
    states.forEach((state) {
      widgets.add(Padding(
        padding: EdgeInsets.only(right: ScreenUtil().setWidth(16)),
        child: CircleAvatar(
          radius: ScreenUtil().setSp(20),
          backgroundColor: state.color,
          child: CircleAvatar(
            radius: ScreenUtil().setSp(14),
            backgroundColor: state.selected ? Colors.black : state.color,
          ),
        ),
      ));
    });

    return Row(
      children: widgets,
    );
  }
}
