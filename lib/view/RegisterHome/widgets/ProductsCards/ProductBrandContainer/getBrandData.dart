import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/ProductBrandContainer/productBrandGridView.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/getBrandData.dart';
import 'package:flutter/material.dart';
import 'dart:math';

bool listContains(int n, List<int> listaIntegera) {
  for (var x in listaIntegera) {
    if (n == x) {
      return true;
    }
  }
  return false;
}

FutureBuilder getBrandDataFutureBuilder(int index) {
  return FutureBuilder(
    future: getBrandData(categoryBrand[index].productBrand),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        //var random = new Random();
        List<int> indexi = List<int>();
        var random = new Random();
        do {
          final result = random.nextInt(snapshot.data.length);
          if (!listContains(result, indexi)) indexi.add(result);
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
  );
}
