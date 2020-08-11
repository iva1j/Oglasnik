import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardDescription.dart';

import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';

Container itemCardBodyDesc(AsyncSnapshot snapshot, int index) {
  return Container(
    width: SizeConfig.blockSizeHorizontal * 53,
    margin: EdgeInsets.only(
      right: SizeConfig.blockSizeVertical * 2,
    ),

    ///Fahrudin
    ///
    ///gledamo da li je duzina opisa nekog artikla manja od 150, u slucaju da
    ///jeste onda ga jednostavno ispisujemo u item card-u. Ako nije onda gledamo da li u
    ///podstringu (0,150) postoji tacka. Ukoliko postoji
    ///uzimamo onoliko karaktera na kojoj je poziciji zadnja tacka u
    ///podstringu od 150 karaktera kompletnog opisa, uklanjamo whitespace-ove
    ///i dodajemo mu ... na kraj. Ukoliko nema tacke u prvih 150 karaktera opisa, onda
    ///ispisemo prvih 150 karaktera i dodamo ...
    child: snapshot.data.documents[index]['productDesc']
                .toString()
                .trim()
                .length <
            150
        ? itemCardDescription(snapshot.data.documents[index]['productDesc'])
        : snapshot.data.documents[index]['productDesc']
                .toString()
                .trim()
                .substring(0, 150)
                .contains('.')
            ? itemCardDescription(snapshot.data.documents[index]['productDesc']
                    .toString()
                    .substring(
                        0,
                        snapshot.data.documents[index]['productDesc']
                            .toString()
                            .substring(0, 150)
                            .lastIndexOf('.'))
                    .trim() +
                "...")
            : itemCardDescription(
                snapshot.data.documents[index]['productDesc']
                        .toString()
                        .substring(0, 150) +
                    '...',
              ),
  );
}
