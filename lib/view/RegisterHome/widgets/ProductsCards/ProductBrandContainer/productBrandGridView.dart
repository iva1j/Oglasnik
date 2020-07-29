import 'package:flutter/material.dart';

GridView productBrandImages(AsyncSnapshot snapshot, List<int> indexi) {
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
}
