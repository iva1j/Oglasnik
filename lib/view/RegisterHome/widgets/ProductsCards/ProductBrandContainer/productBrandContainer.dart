import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/getBrandData.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ProductBrandContainer extends StatelessWidget {
  bool listContains(int n, List<int> listaIntegera) {
    for (var x in listaIntegera) {
      if (n == x) {
        return true;
      }
    }
    return false;
  }

  const ProductBrandContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoryBrand.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ItemCard(
                        brandNameScreen: categoryBrand[index].productBrand,
                      )));
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
                            categoryBrand[index].productBrand),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshott) {
                          if (!snapshott.hasData)
                            return Center(
                              child: SpinnerCircular(),
                            );
                          else {
                            return Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 3,
                                      top: SizeConfig.blockSizeVertical * 2,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (_) => ItemCard(
                                                      brandNameScreen:
                                                          categoryBrand[index]
                                                              .productBrand,
                                                    )));
                                      },
                                      child: Text(
                                        categoryBrand[index].productBrand,
                                        style: TextStyle(
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal *
                                                  5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                        left:
                                            SizeConfig.blockSizeHorizontal * 3,
                                        top: SizeConfig.blockSizeVertical * 1,
                                      ),
                                      child: Text(
                                          'U ovoj kategoriji nalazi se ' +
                                              snapshott.data.toString() +
                                              ' ' +
                                              categoryBrand[index]
                                                  .productBrand +
                                              '.')),
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
                                return new GridView.count(
                                  padding: EdgeInsets.all(0),
                                  physics: new NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 3,
                                  mainAxisSpacing: 3,
                                  children: <Widget>[
                                    Image.network(
                                      snapshot.data[indexi[0]],
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      snapshot.data[indexi[1]],
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      snapshot.data[indexi[2]],
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      snapshot.data[indexi[3]],
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                  shrinkWrap: true,
                                );
                              } else {
                                return Center(
                                  child: SpinnerCircular(),
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
          );
        });
  }
}
