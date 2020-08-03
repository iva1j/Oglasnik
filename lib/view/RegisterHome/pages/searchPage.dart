import 'package:Oglasnik/utils/shared/globalVariables.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/bottomSheet.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/logoutButton.dart';
import 'package:Oglasnik/view/RegisterHome/widgets/mainFloatingButton.dart';
import 'package:flutter/material.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:Oglasnik/view/AnonymousHome/widgets/homeFloatingButton.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   List<dynamic> products = [];
//   // @override
//   // Widget build(BuildContext context) {
//   //   setState(() {
//   //     isLoading = false;
//   //     doesPop = true;
//   //   });
//   //   SizeConfig().init(context);
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       backgroundColor: AppBarTheme.of(context).color,
//   //       centerTitle: true,
//   //       title: Text('Oglasnik'),
//   //       leading: LogoutButton(),
//   //       actions: <Widget>[
//   //         IconButton(
//   //           icon: Icon(Icons.search),
//   //           onPressed: () {
//   //             showSearch(context: context, delegate: DataSearch());
//   //           },
//   //         )
//   //       ],
//   //     ),
//   //     floatingActionButton: email != null
//   //         ? mainFloatingButton(email)
//   //         : homeFloatingAnimatedButton(),
//   //     bottomSheet: BottomSheetContainer(),
//   //     body: Container(
//   //       child: Card(
//   //         child: Text(query),
//   //       ),
//   //     ),
//   //   );
//   // }
// }

class DataSearch extends SearchDelegate<String> {
  final cars = [
    "Audi",
    "Audi",
    "Mercedes",
    "Volvo",
    "Range rover",
    "Toyota",
    "Subaru",
    "BMW",
    "Ford"
  ];

  final recentCars = [
    "Audi",
    "Mercedes",
    "Volvo",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return kartice
    return Scaffold(
      floatingActionButton: email != null
          ? mainFloatingButton(email)
          : homeFloatingAnimatedButton(),
      bottomSheet: BottomSheetContainer(),
      body: Center(
        child: Container(
          height: 200.0,
          width: 200.0,
          child: Card(
            child: Center(child: Text(query)),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionsList = query.isEmpty
        ? recentCars
        : cars.where((e) => e.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
              text: suggestionsList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionsList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionsList.length,
    );
  }
}
