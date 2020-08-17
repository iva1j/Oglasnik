import 'package:Oglasnik/view/RegisterHome/widgets/MyFavorites/favoritesContainer.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/spinnerCircular.dart';
import 'package:Oglasnik/viewModel/FavoriteProduct/favoriteProductViewModel.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/MyFavorites/favItemRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/MyFavorites/favProductsRow.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/itemCardDetails/itemCardTags.dart';
import 'package:flutter/material.dart';

class MyFavorites extends StatefulWidget {
  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  void justSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FavoriteProduct().listAllFavorites(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: SpinnerCircular(),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.only(bottom: 55),
            child: snapshot.data.length == 0
                ? Center(child: Text("Nemate sacuvanih proizvoda."))
                : ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, int index) {
                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            onTapFavorites(
                                context, snapshot, index, justSetState);
                          },
                          child: FavContainer(
                            snapshot: snapshot,
                            index: index,
                          ),
                        ),
                      );
                    }),
          );
        }
      },
    );
  }
}
