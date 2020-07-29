import 'package:Oglasnik/utils/enterexitTransitionRoutes.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/categoryCardRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/topBrands.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

class CategoryCardContainer extends StatelessWidget {
  const CategoryCardContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 55),
      child: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
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
              margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                right: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 3,
                bottom: SizeConfig.blockSizeVertical * 2,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).push(
                          FadeRoute(
                            page: ProductBrandCard(
                              categoryName: categories[index].categoryName,
                            ),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: SizeConfig.blockSizeVertical),
                          child: Text(
                            categories[index].categoryName,
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: SizeConfig.blockSizeVertical * 0.2,
                  ),
                  FutureBuilder(
                      future: top3BrandsPerCategoryV2(
                          categories[index].categoryName),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<String> names = snapshot.data.keys.toList();
                          List<dynamic> counts = snapshot.data.values.toList();
                          return names.length == 3
                              ? Column(children: <Widget>[
                                  CategoryCardRow(
                                    icon: Transform.scale(
                                      scale: 0.8,
                                      child: SvgPicture.network(
                                          categories[index].icon),
                                    ),
                                    name: names[0],
                                    count: counts[0].toString(),
                                  ),
                                  CategoryCardRow(
                                    icon: Transform.scale(
                                      scale: 0.8,
                                      child: SvgPicture.network(
                                          categories[index].icon),
                                    ),
                                    name: names[1],
                                    count: counts[1].toString(),
                                  ),
                                  CategoryCardRow(
                                    icon: Transform.scale(
                                      scale: 0.8,
                                      child: SvgPicture.network(
                                          categories[index].icon),
                                    ),
                                    name: names[2],
                                    count: counts[2].toString(),
                                  ),
                                ])
                              : names.length == 2
                                  ? Column(children: <Widget>[
                                      CategoryCardRow(
                                        icon: Transform.scale(
                                          scale: 0.8,
                                          child: SvgPicture.network(
                                              categories[index].icon),
                                        ),
                                        name: names[0],
                                        count: counts[0].toString(),
                                      ),
                                      CategoryCardRow(
                                        icon: Transform.scale(
                                          scale: 0.8,
                                          child: SvgPicture.network(
                                              categories[index].icon),
                                        ),
                                        name: names[1],
                                        count: counts[1].toString(),
                                      ),
                                    ])
                                  : names.length == 1
                                      ? Column(children: <Widget>[
                                          CategoryCardRow(
                                            icon: Transform.scale(
                                              scale: 0.8,
                                              child: SvgPicture.network(
                                                  categories[index].icon),
                                            ),
                                            name: names[0],
                                            count: counts[0].toString(),
                                          ),
                                        ])
                                      : Container(
                                          width: 0,
                                          height: 0,
                                        );
                        } else {
                          return Center(
                            child: SpinnerCircular(),
                          );
                        }
                      }),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 3,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
