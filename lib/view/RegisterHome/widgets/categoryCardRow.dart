import 'package:Oglasnik/utils/colors_and_themes/colors.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class CategoryCardRow extends StatelessWidget {
  final String name, count;
  final Widget icon;

  const CategoryCardRow({
    this.icon,
    this.name,
    this.count,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            citysuggestions.addAll(selectedChips);
            selectedChips.clear();
            Navigator.of(context).push(
              FadeRoute(
                page: ItemCard(
                  brandNameScreen: name,
                ),
              ),
            );
          },
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
                      radius: 20,
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
                        fontWeight: FontWeight.w400,
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
      ),
    );
  }
}
