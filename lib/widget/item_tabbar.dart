import 'dart:html';

import 'package:apps/model/categori.dart';
import 'package:flutter/material.dart';

class ItemTapBar extends StatelessWidget {
  const ItemTapBar({Key key,  this.categori}) : super(key: key);
  final Categori categori;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(categori.tittle),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(categori.body),
          )
        ],
      ),
    );
  }
}
