import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ListCard extends StatelessWidget {
  const ListCard({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10,left: 12,bottom: 14,right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/image_shoes.png',width: 60,),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("merek",style: primaryTextStyle.copyWith(
                  fontWeight: semiBold
                ),),
                Text("\$143,93",style: primaryTextStyle.copyWith(
                  fontWeight: semiBold
                ),)
              ],
            ),
          ),
          Icon(FontAwesomeIcons.shippingFast,size: 16 , color: priceColor,)
        ],
      ),
      
    );
  }
}