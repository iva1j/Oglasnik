
import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class CategoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 5,
          vertical: SizeConfig.blockSizeVertical * 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
                child: Text(
                  "Automobili",
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: SizeConfig.blockSizeVertical * 0.2,
            ),
            CategoryCardRow(
              icon: Icon(
                Icons.directions_car,
                color: Colors.white,
              ),
              name: "Audi",
              count: "134",
            ),
            CategoryCardRow(
              icon: Icon(
                Icons.directions_car,
                color: Colors.white,
              ),
              name: "Mercedes",
              count: "15",
            ),
            CategoryCardRow(
              icon: Icon(
                Icons.directions_car,
                color: Colors.white,
              ),
              name: "BMW",
              count: "1",
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            )
          ],
        ),
      ),
    );
  }
}

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

