import 'package:Oglasnik/utils/globals.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/checkingInternet.dart';
import 'package:Oglasnik/utils/shared/checkingInternetConnection/internetDialog.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/shared/sharedbuttons/mainAppButtons/redButton.dart';
import 'package:Oglasnik/viewModel/ImageUpload/createProductPressed.dart';
import 'package:Oglasnik/viewModel/ImageUpload/updateProductPressed.dart';
import 'package:flutter/cupertino.dart';

class PageFiveSubmit extends StatefulWidget {
  const PageFiveSubmit({
    Key key,
    @required this.context,
    @required this.onFlatButtonPressed,
  }) : super(key: key);

  final BuildContext context;
  final VoidCallback onFlatButtonPressed;

  @override
  _PageFiveSubmitState createState() => _PageFiveSubmitState();
}

class _PageFiveSubmitState extends State<PageFiveSubmit> {
  @override
  Widget build(BuildContext context) {
    if (!createSwitcher) {
      return button("Završi", () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        await InternetConnectivity().checkForConnectivity();
        if (hasActiveConnection == true) {
          if (pageController.page == 4) {
            if (productPriceFormKey.currentState.validate()) {
              widget.onFlatButtonPressed();
              await updateProductPressed(context);
            } else
              return null;
          }
        } else
          displayInternetDialog(context);
      });
    } else {
      return button("Završi", () async {
        FocusScope.of(context).requestFocus(new FocusNode());
        await InternetConnectivity().checkForConnectivity();

        if (hasActiveConnection) {
          if (pageController.page == 4) {
            if (productPriceFormKey.currentState.validate()) {
              widget.onFlatButtonPressed();
              await createProductPressed(context);
            } else
              return null;
          }
        } else
          displayInternetDialog(context);
      });
    }
  }
}
