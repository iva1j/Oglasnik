import 'package:Oglasnik/main.dart';
import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';

import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/categoryCardRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewCategory.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';

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
                categories = snapshot.data.documents
                    .map((doc) => ProductCategory.fromDocument(doc))
                    .toList();
                return ListView.builder(
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
                                margin: EdgeInsets.only(
                                    top: SizeConfig.blockSizeVertical),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => ProductBrandCard(
                                              categoryName: categories[index]
                                                  .categoryName,
                                            ))); //#TODO: Ubaciti ispravnu putanju
                                  },
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
                                future: numberOfProductsPerBrandTest(
                                    categoryBrands[
                                            categories[index].categoryName][0]
                                        .toString()),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CategoryCardRow(
                                      icon: Icon(
                                        Icons.directions_car,
                                        color: Colors.white,
                                      ),
                                      name: categoryBrands[
                                              categories[index].categoryName][0]
                                          .toString(),
                                      count: snapshot.data.toString(),
                                    );
                                  } else {
                                    return Center(
                                      child: SpinnerCircular(),
                                    );
                                  }
                                }),
                            FutureBuilder(
                                future: numberOfProductsPerBrandTest(
                                    categoryBrands[
                                            categories[index].categoryName][1]
                                        .toString()),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CategoryCardRow(
                                      icon: Icon(
                                        Icons.directions_car,
                                        color: Colors.white,
                                      ),
                                      name: categoryBrands[
                                              categories[index].categoryName][1]
                                          .toString(),
                                      count: snapshot.data.toString(),
                                    );
                                  } else {
                                    return Center(
                                      child: SpinnerCircular(),
                                    );
                                  }
                                }),
                            FutureBuilder(
                                future: numberOfProductsPerBrandTest(
                                    categoryBrands[
                                            categories[index].categoryName][2]
                                        .toString()),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    //print(snapshot.data);
                                    return CategoryCardRow(
                                      icon: Icon(
                                        Icons.directions_car,
                                        color: Colors.white,
                                      ),
                                      name: categoryBrands[
                                              categories[index].categoryName][2]
                                          .toString(),
                                      count: snapshot.data.toString(),
                                    );
                                  } else {
                                    return Center(
                                      child: SpinnerCircular(),
                                    );
                                  }
                                }),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 3,
                            )
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: SpinnerCircular(),
                );
              }
            }),
      ),
    ]);
  }
}
