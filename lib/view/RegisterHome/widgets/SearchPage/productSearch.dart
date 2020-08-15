import 'package:Oglasnik/utils/strings.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/actionChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/ViewChips/dynamicChips.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/selectedProductsInitialization.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/shared/globalVariables.dart';
import '../../../../utils/suggestionFunction.dart';
import '../../../../utils/suggestionFunction.dart';
import '../../../../viewModel/PreviewProduct/previewProduct.dart';
import '../../../../viewModel/PreviewProduct/previewProduct.dart';
import '../../../../viewModel/PreviewProduct/previewProduct.dart';
import '../../../../viewModel/PreviewProduct/previewProduct.dart';
import '../ProductsCards/categoryLoading.dart';
import '../ProductsCards/categoryLoading.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'ProductSearch/itemProductWidgets/itemProductContainer.dart';

class SearchPageFutureBuilder extends StatefulWidget {
  SearchPageFutureBuilder({
    Key key,
    @required this.query,
  }) : super(key: key);
  @override
  final String query;
  _SearchPageFutureBuilderState createState() =>
      _SearchPageFutureBuilderState();
}

class _SearchPageFutureBuilderState extends State<SearchPageFutureBuilder> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    initSelectedProducts(widget.query);

    print("SELEKTED PRODUKTS LOLLL");
    print(selectedProductsGlobal);
    bool showMessage = true;
    List<DocumentSnapshot> additionalProds = List<DocumentSnapshot>();
    additionalProds.addAll(ProductViewModel()
        .addAdditionalBrandProducts(widget.query.toLowerCase()));
    print("A SADA SPEKTAKLLLL");
    print(additionalProds);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 7,
                top: SizeConfig.blockSizeVertical * 2),
            child: Text(
              FilterTitle().filterNaslov,
              style: TextStyle(fontSize: 16.0),
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ActionChipsWidget(refresh),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DynamicChipsWidget(refresh),
        ),
        Expanded(
          child: additionalProds.isEmpty && selectedProductsGlobal.isEmpty
              ? Center(
                  child: Text(TrazeniProizvod().trazeniProizvod),
                )
              : ItemProductContainer(
                  showMessage: showMessage,
                  setStateParent: refresh,
                  additionals: additionalProds,
                ),
        ),
      ],
    );
  }
}
