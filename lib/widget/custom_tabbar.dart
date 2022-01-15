import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key key,
       this.selectedIndex,
       this.titles,
       this.onTap})
      : super(key: key);
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(top: defaultMargin),
      child: Row(
        children:  titles
            .map((e) =>  Padding(
              padding: EdgeInsets.only(left: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    // titles.indexOf(e) == selectedIndex ?
                    SizedBox(width: defaultMargin,),
                    GestureDetector(
                      onTap: () {
                        if (onTap != null) {
                          onTap(titles.indexOf(e));
                        }
                      },
                      child: Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          // margin: EdgeInsets.only(right: 16),
                          decoration: titles.indexOf(e) == selectedIndex
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: primaryColor)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: subtitleColor),
                                  color: transparentColor),
                          child: Text(
                            e,
                            style: primaryTextStyle.copyWith(
                                fontSize: 13, fontWeight: medium),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ))
            .toList(),
      ),
    );
  }
}
