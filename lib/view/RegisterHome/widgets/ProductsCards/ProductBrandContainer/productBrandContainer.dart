import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/utils/suggestionFunction.dart';
import 'package:Oglasnik/utils/transitionFade.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/categoryBrands.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/getBrandData.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandTitle.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandGridView.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandNumberItems.dart';

class ProductBrandContainer extends StatelessWidget {
  final String categoryName;

  bool listContains(int n, List<int> listaIntegera) {
    for (var x in listaIntegera) {
      if (n == x) {
        return true;
      }
    }
    return false;
  }

  const ProductBrandContainer({Key key, @required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryBrand.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              citysuggestions.addAll(selectedChips);
              selectedChips.clear();
              Navigator.of(context).push(
                FadeRoute(
                  page: ItemCard(
                    brandNameScreen: categoryBrand[index].productBrand,
                    categoryName: categoryName,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(5, 5), // changes position of shadow
                  ),
                ],
                border: Border.all(
                  color: Colors.black26,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                right: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeVertical * 4,
                //bottom: SizeConfig.blockSizeVertical * 2,
              ),
              child: Container(
                height: SizeConfig.blockSizeVertical * 25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                        future: numberOfProductsPerBrandTest(
                            categoryBrand[index].productBrand, categoryName),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshott) {
                          if (!snapshott.hasData)
                            return Expanded(
                              child: Center(
                                child: SpinnerCircular(),
                              ),
                            );
                          else {
                            return Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  productBrandTitle(context, index),
                                  productBrandNumberItems(snapshott, index),
                                ],
                              ),
                            );
                          }
                        }),
                    Container(
                      child: Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            right: SizeConfig.blockSizeHorizontal * 3,
                            top: SizeConfig.blockSizeVertical * 2,
                            bottom: SizeConfig.blockSizeVertical * 2,
                          ),
                          child: FutureBuilder(
                            future:
                                getBrandData(categoryBrand[index].productBrand),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                //var random = new Random();
                                List<int> indexi = List<int>();
                                var random = new Random();
                                do {
                                  final result =
                                      random.nextInt(snapshot.data.length);
                                  if (!listContains(result, indexi))
                                    indexi.add(result);
                                } while (indexi.length < 4);
                                return productBrandImages(snapshot, indexi);
                              } else {
                                return Expanded(
                                  child: Center(
                                    child: SpinnerCircular(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
