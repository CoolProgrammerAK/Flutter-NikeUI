import 'package:flutter/material.dart';
import 'package:mynike/clipper/app_clipper.dart';
import 'package:mynike/const.dart';
import 'package:mynike/flutter_icon.dart';
import 'package:mynike/model/shoemodel.dart';
import 'dart:math';

import 'package:mynike/pages/detail.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<ShoeModel> shoelist = ShoeModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                IconButton(
                  icon: Icon(FlutterIcons.search, color: Colors.black26),
                  onPressed: null,
                )
              ],
            ),
          ),
          Container(
            height: 350,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: shoelist.length,
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DetailPage(shoeModel:shoelist[index])));
                    },
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.only(right: 16),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: _buildbg(index, 230),
                          ),
                          Positioned(
                            bottom: 190,
                            right: 10,
                            child: Hero(
                              tag: shoelist[index].imgPath,
                              child: Transform.rotate(
                                angle: -pi / 7,
                                child: Image(
                                  width: 220,
                                  image: AssetImage(
                                      "assets/${shoelist[index].imgPath}"),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "JUST FRO YOU",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                Text("View ALL",
                    style:
                        TextStyle(color: AppColors.greenColor, fontSize: 12)),
              ],
            ),
          ),
          SizedBox(height: 24),
          ...shoelist.map((data) {
            return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DetailPage(shoeModel:data)));
                    },
              child: Container(
                margin: EdgeInsets.only(top: 16, bottom: 10, left: 10, right: 10),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 10, spreadRadius: 1)
                    ]),
                child: Row(
                  children: [
                    Hero(
                       tag: data.imgPath,
                      child: Image(
                          image: AssetImage("assets/${data.imgPath}"),
                          width: 100,
                          height: 60),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * .45,
                              child: Text(
                                "${data.name}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Text(
                            "${data.brand}",
                            style: TextStyle(color: Colors.black26, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("\$${data.price.toInt()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    )
                  ],
                ),
              ),
            );
          })
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.greenColor,
          unselectedItemColor: Colors.black26,
          currentIndex: 1,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(FlutterIcons.compass),
                ),
                label: "data"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.list), label: "data"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.bag), label: "data"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.person_outline), label: "data"),
            BottomNavigationBarItem(
                icon: Icon(FlutterIcons.compass), label: "data"),
          ],
        ),
      ),
    );
  }

  Widget _buildbg(int index, double width) {
    return ClipPath(
      clipper: AppClipper(25, 180),
      child: Container(
        width: width,
        color: shoelist[index].color,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Icon(
                    shoelist[index].brand == "Nike"
                        ? FlutterIcons.nike
                        : FlutterIcons.converse,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  width: 125,
                  child: Text("${shoelist[index].name}",
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "${shoelist[index].price}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 100 / 2,
              height: 100 / 2,
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(10))),
              child: Center(
                child: Icon(
                  FlutterIcons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
