import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mynike/clipper/app_clipper.dart';
import 'package:mynike/const.dart';
import 'package:mynike/flutter_icon.dart';
import 'package:mynike/model/shoemodel.dart';
import 'dart:math';

class DetailPage extends StatefulWidget {
  final ShoeModel shoeModel;
  DetailPage({Key? key, required this.shoeModel}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoeModel.color,
      appBar: AppBar(
        backgroundColor: widget.shoeModel.color,
        elevation: 0,
        title: Text('Categories'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(FlutterIcons.left_open_1)),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * .75,
              width: MediaQuery.of(context).size.width,
              child: ClipPath(
                clipper: AppClipper(30, 180, roundedbtn: false),
                child: Container(
                  padding: EdgeInsets.only(top: 150, left: 16, right: 16),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 300,
                        child: Text(
                          "${widget.shoeModel.name}",
                          style: TextStyle(fontSize: 23),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      _buildrating(),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${widget.shoeModel.desc}",
                        style: TextStyle(color: Colors.black38),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Color Options",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          _buildcolorcontainer(AppColors.blueColor),
                          _buildcolorcontainer(AppColors.greenColor),
                          _buildcolorcontainer(AppColors.orangeColor),
                          _buildcolorcontainer(AppColors.redColor),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: _buildbottom(),
            bottom: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Hero(
              tag: widget.shoeModel.imgPath,
              child: Transform.rotate(
                angle: -pi / 7,
                child: Image(
                    width: MediaQuery.of(context).size.width * .85,
                    image: AssetImage('assets/${widget.shoeModel.imgPath}')),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildbottom() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 10)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "PRICE",
                style: TextStyle(color: Colors.black26),
              ),
              Text("\$${widget.shoeModel.price.toInt()}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
              child: Text(
                "Add Cart",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget _buildcolorcontainer(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }

  Widget _buildrating() {
    return Row(
      children: [
        RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            itemPadding: EdgeInsets.symmetric(horizontal: 2),
            itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (rating) {
              print(rating);
            }),
        SizedBox(
          width: 16,
        ),
        Text("134 Reviews")
      ],
    );
  }
}
