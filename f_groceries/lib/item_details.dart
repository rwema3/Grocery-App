import 'package:f_groceries/Cart_Screen.dart';
import 'package:f_groceries/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class Item_Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => item_details();
}

class item_details extends State<Item_Details> {
  String toolbarname = 'Fruiys & Vegetables';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List list = ['12', '11'];

  String itemname = 'Apple';
  int item = 0;
  String itemprice = '\$15';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.windows:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      return null;
    }

    IconData _add_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.windows:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      return null;
    }

    IconData _sub_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.windows:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }
      return null;
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(_backIcon()),
            alignment: Alignment.centerLeft,
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(toolbarname),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150.0,
                width: 30.0,
                child: GestureDetector(
                  onTap: () {
                    /*Navigator.of(context).push(
                   MaterialPageRoute(
                      builder:(BuildContext context) =>
                       CartItemsScreen()
                  )
              );*/
                  },
                  child: Stack(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Checkout()));
                          }),
                      list.length == 0
                          ? Container()
                          : Positioned(
                              child: Stack(
                              children: <Widget>[
                                Icon(Icons.brightness_1,
                                    size: 20.0, color: Colors.orange.shade500),
                                Positioned(
                                    top: 4.0,
                                    right: 5.5,
                                    child: Center(
                                      child: Text(
                                        list.length.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ],
                            )),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Card(
                elevation: 4.0,
                child: Container(
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // photo and title
                        SizedBox(
                          height: 250.0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                child: Carousel(
                                  images: [
                                    AssetImage(
                                      'images/apple.jpg',
                                      // package: destination.assetPackage,
                                    ),
                                    AssetImage(
                                      'images/tomato.jpg',
                                      // package: destination.assetPackage,
                                    ),
                                    AssetImage(
                                      'images/lemons.jpg',
                                      // package: destination.assetPackage,
                                    ),
                                    AssetImage(
                                      'images/kiwi.jpg',
                                      // package: destination.assetPackage,
                                    ),
                                    AssetImage(
                                      'images/guava.jpg',
                                      // package: destination.assetPackage,
                                    ),
                                    AssetImage(
                                      'images/grapes.jpg',
                                      // package: destination.assetPackage,
                                    ),
                                  ],
                                  boxFit: BoxFit.scaleDown,
                                  showIndicator: false,
                                  autoplay: false,
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: DefaultTextStyle(
                      style: descriptionStyle,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              itemname,
                              style: descriptionStyle.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              itemprice,
                              style: descriptionStyle.copyWith(
                                  fontSize: 20.0, color: Colors.black54),
                            ),
                          ),
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                      child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                          child: DefaultTextStyle(
                              style: descriptionStyle,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // three line description
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(_add_icon(),
                                            color: Colors.amber.shade500),
                                        onPressed: () {
                                          item = item + 1;
                                        },
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 2.0),
                                      ),
                                      Text(
                                        item.toString(),
                                        style: descriptionStyle.copyWith(
                                            fontSize: 20.0,
                                            color: Colors.black87),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 2.0),
                                      ),
                                      IconButton(
                                        icon: Icon(_sub_icon(),
                                            color: Colors.amber.shade500),
                                        onPressed: () {
                                          if (item < 0) {
                                          } else {
                                            item = item - 1;
                                          }
                                        },
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.amber.shade500),
                                          child: const Text('Add'),
                                          textColor: Colors.amber.shade500,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Cart_screen()));
                                          },
                                          shape: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          )),
                                    ),
                                  ),
                                ],
                              ))))),
              Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: DefaultTextStyle(
                      style: descriptionStyle,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Details',
                              style: descriptionStyle.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ))),
              Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
                  child: Text(
                      "Grocery stores also offer non-perishable foods that are packaged in bottles, boxes, and cans; some also have bakeries, butchers, delis, and fresh produce. Large grocery stores that stock significant amounts of non-food products, such as clothing and household items, are called supermarkets. Some large supermarkets also include a pharmacy, and customer service, redemption, and electronics sections.",
                      maxLines: 10,
                      style: TextStyle(fontSize: 13.0, color: Colors.black38))),
            ]))));
  }
}
