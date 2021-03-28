import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/data.dart';
import 'package:food_app/popular_food.dart';

import 'FoodModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // ignore: deprecated_member_use
  List<FoodModel> food = new List();
  List<popularfood> popularfoods = new List();

  @override
  void initState() {
    food = getFood();
    popularfoods = getpopularfood();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu_open,color: Colors.green,size: 30,),
        title: Padding(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/fork.png",height: 27.0,color: Colors.green,),
              Text(" Food",
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
              Text("App",
                style: TextStyle(
                    color: Colors.green,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
            ],
          ),
        ),
        actions: [
          Icon(Icons.more_vert,
          color: Colors.green,
            size: 30,
          )
        ],
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Find ur Food",
              style: TextStyle(
                color: Color(0xff348055),
                fontWeight: FontWeight.w800,
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),),
             SizedBox(height: 10,),
              Container(
                height: 240,
                child: ListView.builder(
                    itemCount: food.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return FoodListTile(
                        label: food[index].label,
                        foodname: food[index].foodname,
                        rating:  food[index].rating,
                        imgurl: food[index].imgurl,
                      );
                    }),
              ),
              SizedBox(height: 5),
              Text("Popular Food",
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff348055),
                fontWeight: FontWeight.w600
              ),),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: popularfoods.length,
                    itemBuilder:(context, index) {
                     return Popular(
                       title: popularfoods[index].title,
                       desc: popularfoods[index].desc,
                       price: popularfoods[index].price,
                       rating: popularfoods[index].rating,
                       imgurl: popularfoods[index].imgurl,
                     );
                  }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodListTile extends StatelessWidget {

  final String label;
  final String foodname;
  final double rating;
  final String imgurl;

  const FoodListTile({@required this.label,@required this.foodname,@required this.rating,@required this.imgurl});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: imgurl,
            height: 200,
              width: 150,
            ),
          ),
          Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,top: 8),
                      //padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent
                      ),
                      child: Text(label,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        fontSize: 17.0
                      ),),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 8),
                      child: Column(
                        children: [
                          Container(
                            child: Text(foodname,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              fontSize: 16.0
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(bottom: 10,right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 3,vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white38
                      ),
                      child: Column(
                        children: [
                          Text("$rating",style: TextStyle(color: Colors.white),),
                          SizedBox(height: 2,),
                          Icon(Icons.star,
                          color: Colors.white,
                          size: 20,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Popular extends StatelessWidget {
  
  final String imgurl;
  final String title;
  final String desc;
  final String price;
  final double rating;

  const Popular({ @required this.imgurl,@required  this.title,@required  this.desc,@required  this.price,@required  this.rating});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
         color: Color(0xffE9F4F9),
         borderRadius: BorderRadius.circular(20)
       ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Image.network(
                "https://images.unsplash.com/photo-1490645935967-10de6ba17061?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzF8fGZvb2R8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
              height:110,
              width: 110,
              fit: BoxFit.cover,
            )
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8,right: 100),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Salad",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
                ),
                SizedBox(height: 3,),
                Text("Salad Lovers!",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
                SizedBox(height: 3,),
                Text("2.5",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w400,fontStyle: FontStyle.italic),),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 8,right: 8),
            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xff139157),
            ),
            child: Column(
              children: [
                Text("2.5",style: TextStyle(color: Colors.white),),
                SizedBox(height: 12,),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
