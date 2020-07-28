import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';

import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/categoryCardRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinner.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewCategory.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

List categories = [];

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(children: <Widget>[
      Expanded(
        child: FutureBuilder(
            future: CategoryViewModel().getCategories(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                categories = snapshot.data
                    .map((doc) => ProductCategory.fromDocument(doc))
                    .toList();
                //print(snapshot.data.forEach((element) => print(element[])))
                return ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        // margin: EdgeInsets.symmetric(
                        //   horizontal: SizeConfig.blockSizeHorizontal * 5,
                        //   vertical: SizeConfig.blockSizeVertical * 5,
                        // ),
                        margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 5,
                          right: SizeConfig.blockSizeHorizontal * 5,
                          top: SizeConfig.blockSizeVertical * 5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ProductBrandCard(
                                      categoryName:
                                          categories[index].categoryName,
                                    ),
                                  ),
                                ); //#TODO: Ubaciti ispravnu putanju
                              },
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: SizeConfig.blockSizeVertical),
                                  child: Text(
                                    categories[index].categoryName,
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 5,
                                      fontWeight: FontWeight.w700,
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
                                    List<String> names =
                                        snapshot.data.keys.toList();
                                    List<dynamic> counts =
                                        snapshot.data.values.toList();
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
                                                        child:
                                                            SvgPicture.network(
                                                                categories[
                                                                        index]
                                                                    .icon),
                                                      ),
                                                      name: names[0],
                                                      count:
                                                          counts[0].toString(),
                                                    ),
                                                  ])
                                                : Container();
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
                    });
              } else {
                return Center(
                  child: Loading(),
                );
              }
            }),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical * 8,
      ),
    ]);
  }
}
