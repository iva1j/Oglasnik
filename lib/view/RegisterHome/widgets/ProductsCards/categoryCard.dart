import 'package:Oglasnik/model/productCategoryModel.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/categoryCardRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinner.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewCategory.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewProductViewModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

import 'CategoryCardContainer/categoryCardContainer.dart';

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
                return CategoryCardContainer();
              } else {
                return Center(
                  child: Loading(),
                );
              }
            }),
      ),
    ]);
  }
}

