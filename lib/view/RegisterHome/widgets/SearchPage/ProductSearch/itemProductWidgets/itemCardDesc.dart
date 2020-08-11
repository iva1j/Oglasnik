import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/SearchPage/ProductSearch/itemProductWidgets/itemProductContainer.dart';
import 'package:flutter/material.dart';

Container itemCardDesc(int index) {
  return Container(
    width: SizeConfig.blockSizeHorizontal * 53,
    margin: EdgeInsets.only(
      right: SizeConfig.blockSizeVertical * 2,
    ),

    ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
    ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda
    ///uzimamo njegovih prvih 150 character-a, uklanjamo whitespace-ove
    ///i dodajemo mu ... na kraj.
    child: selectedProducts[index]['productDesc'].toString().trim().length < 150
        ? itemCardDescription(selectedProducts[index]['productDesc'])
        : selectedProducts[index]['productDesc']
                .toString()
                .trim()
                .substring(0, 150)
                .contains('.')
            ? itemCardDescription(selectedProducts[index]['productDesc']
                    .toString()
                    .substring(
                        0,
                        selectedProducts[index]['productDesc']
                            .toString()
                            .substring(0, 150)
                            .lastIndexOf('.'))
                    .trim() +
                "...")
            : itemCardDescription(selectedProducts[index]['productDesc']
                    .toString()
                    .substring(0, 150) +
                '...'),
  );
}
