import 'package:cloud_firestore/cloud_firestore.dart';

///Fahrudin
///
///Funkcija je nastala iz potrebe za rjesavanje taska OG-205 (search query (hint: puma)) i ona vraca sve produkte
///iz baze sa proslijedjenim nazivom branda i radice bez obzira na mala i velika slova. Takodjer dole zakomentirana linija
///ukoliko se otkomentira, vratice produkte iz baze ciji je tip branda proslijedjeni parametar brandName i koje u nazivu
///imaju naziv tog branda
getProductsPerBrand(String brandName) async {
  final QuerySnapshot productQuery = await Firestore.instance
      .collection('products')
      .where('productFinished', isEqualTo: false)
      .getDocuments();

  List<DocumentSnapshot> productsList = productQuery.documents;
  List<DocumentSnapshot> forReturn = List<DocumentSnapshot>();
  //brandName = brandName.toLowerCase();

  for (int i = 0; i < productsList.length; i++) {
    if (productsList[i]['productBrand'].toString().toLowerCase() == brandName) {
      //if (productList[i]['productName'].toString().toLowerCase().contains(brandName))
      forReturn.add(productsList[i]);
    }
  }

  return forReturn;
}
