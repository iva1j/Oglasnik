import 'package:Oglasnik/utils/shared/globalVariables.dart';

void initValuesOnProductCreated() {
  loadingGlob = true;
  createdGlob = true;

  productName = newProductNameReturn;
  productCategory = dropdownValueCategory;
  productBrand = dropdownValueBrand;
  productLocation = dropdownValueCity;
  productTag = newProductTagsReturn;
  productDesc = newProductDescriptionReturn;
  productprice = newProductPriceReturn;
}
