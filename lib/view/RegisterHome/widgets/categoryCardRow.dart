import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class CategoryCardRow extends StatelessWidget {
  final String name, count;
  final Icon icon;

  const CategoryCardRow({
    this.icon,
    this.name,
    this.count,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: mainAppColor,
                    child: icon,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeVertical * 2,
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                right: SizeConfig.blockSizeHorizontal * 4,
                top: SizeConfig.blockSizeVertical * 2,
              ),
              child: Text(
                count,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
