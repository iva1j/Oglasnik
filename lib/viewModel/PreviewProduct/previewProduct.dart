import 'package:Oglasnik/interface/productInterface.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productBrandCard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/productDetails.dart';
import 'package:Oglasnik/interface/productInterface.dart';

Image buildImageWidget(String imagePath) {
  return Image.asset(imagePath);
}

class ProductViewModel implements ReadProductInterface {
  @override
  Future getProduct() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('products').getDocuments();
    return qn;
  }
}

// class Citanje extends StatefulWidget {
//   @override
//   _CitanjeState createState() => _CitanjeState();
// }

// class _CitanjeState extends State<Citanje> {
//   @override
//   Widget build(BuildContext context) {
//     String productNametest, productCategoryTest;
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.all(50),
//         child: StreamBuilder(
//           stream: Firestore.instance.collection('products').snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Container(
//                 child: Card(
//                   elevation: 8,
//                   color: Colors.white,
//                   child: Text('No Items'),
//                 ),
//               );
//             }
//             return Container(
//               child: ListView.builder(
//                   itemCount: snapshot.data.documents.length,
//                   itemBuilder: (_, int index) {
//                     return Container(
//                       child: Card(
//                         color: Colors.white,
//                         child: Column(
//                           children: <Widget>[
//                             // ProductDetails(
//                             //   snapshot.data.documents[index]['email'],
//                             //   snapshot.data.documents[index]['productCategory'],
//                             // ),
//                             ProductDetails(),
//                             // Text('Name: ' +
//                             //     snapshot.data.documents[index]['email']),
//                             // Text('Faction: ' +
//                             //     snapshot.data.documents[index]
//                             //         ['productCategory']),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
