import 'package:Oglasnik/model/userModel.dart';
import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/ProductsCards/categoryLoading.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updateEmailProfile.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updateNameProfile.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/UpdateProfile/profileForm/updatePhoneProfile.dart';
import 'package:Oglasnik/viewModel/EditingUser/editUserViewModel.dart';
import 'package:Oglasnik/viewModel/PreviewProduct/previewCategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List<DocumentSnapshot> userInfo = List<DocumentSnapshot>();

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    Key key,
  }) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: SizeConfig.blockSizeHorizontal * 13,
        right: SizeConfig.blockSizeHorizontal * 13,
      ),
      child: Form(
        key: updateproductNameFormKey,
        child: Theme(
          data: ThemeData(
            primaryColor: Colors.black54,
            errorColor: Colors.red,
          ),
          child: FutureBuilder(
              future: Firestore.instance
                  .collection('firestoreUsers')
                  .where('email', isEqualTo: email)
                  .getDocuments(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData)
                  return CategoryLoading();
                else {
                  userInfo.clear();
                  userInfo = snapshot.data.documents;
                  return Column(
                    children: <Widget>[
                      UpdateName(user: userInfo[0]),
                      UpdateEmail(user: userInfo[0]),
                      UpdatePhone(user: userInfo[0]),
                    ],
                  );

                  // ListView.builder(
                  //     shrinkWrap: true,
                  //     itemCount: userInfo.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return Column(
                  //         children: <Widget>[
                  //           UpdateName(user: userInfo[index]),
                  //           UpdateEmail(user: userInfo[index]),
                  //           UpdatePhone(user: userInfo[index]),
                  //         ],
                  //       );
                  //     });
                }
              }),
        ),
      ),
    );
  }
}
