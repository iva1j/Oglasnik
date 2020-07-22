import 'package:Oglasnik/model/productModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewBrand.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProduct.dart';
import 'package:flutter/material.dart';

class ProductBrandCard extends StatelessWidget {
  List<Widget> images = new List<Widget>();
  final String categoryName;
  ProductBrandCard({Key key, @required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    images.add(Image.asset(
      'assets/images/audi.jpg',
      height: SizeConfig.blockSizeHorizontal * 4,
      width: SizeConfig.blockSizeHorizontal * 4,
      fit: BoxFit.fill,
    ));
    images.add(Image.asset(
      'assets/images/audi2.jpg',
      height: SizeConfig.blockSizeHorizontal * 4,
      width: SizeConfig.blockSizeHorizontal * 4,
      fit: BoxFit.fill,
    ));
    images.add(Image.asset(
      'assets/images/audi3.jpg',
      height: SizeConfig.blockSizeHorizontal * 4,
      width: SizeConfig.blockSizeHorizontal * 4,
      fit: BoxFit.fill,
    ));
    images.add(Image.asset(
      'assets/images/audi4.jpg',
      height: SizeConfig.blockSizeHorizontal * 4,
      width: SizeConfig.blockSizeHorizontal * 4,
      fit: BoxFit.fill,
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: FutureBuilder(
          future: BrandViewModel().getBrandsByCategories(categoryName),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              categoryBrand = snapshot.data.documents
                  .map((doc) => ProductBrand.fromDocument(doc))
                  .toList(); 
              return ListView.builder(
                  itemCount: categoryBrand.length,
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
                            offset: Offset(0, 9), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 5,
                        vertical: SizeConfig.blockSizeVertical * 10,
                      ),
                      child: Container(
                        height: SizeConfig.blockSizeVertical * 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
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
                                    child: Text(
                                      categoryBrand[index].brands[0],
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: SizeConfig.blockSizeHorizontal * 3,
                                      top: SizeConfig.blockSizeVertical * 1,
                                    ),
                                    child: Text(
                                      'U ovoj kategoriji se nalazi 134 Audi.',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right: SizeConfig.blockSizeHorizontal * 3,
                                    top: SizeConfig.blockSizeVertical * 2,
                                    bottom: SizeConfig.blockSizeVertical * 2,
                                  ),
                                  child: new GridView.count(
                                    padding: EdgeInsets.all(0),
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 3,
                                    mainAxisSpacing: 3,
                                    children: images,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
