import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/dashboard/widgets/category.dart';
import 'package:pal_prashnotarri_teacher/ui/screens/dashboard/widgets/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static Route<dynamic> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(builder: (context) => HomeScreen());
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final _categorylist = [
    MenuCategory(
      title: 'Category',
      icon: Icons.home,
      count: '1',
      color: Colors.purple,
    ),
    MenuCategory(
        title: 'Sub Category',
        icon: Icons.home,
        count: '2',
        color: Colors.blue),
    MenuCategory(
        title: 'Questions',
        icon: Icons.question_mark_rounded,
        count: '1   ',
        color: Colors.orangeAccent),
    MenuCategory(
        title: 'Registered Devices',
        icon: Icons.supervised_user_circle_sharp,
        count: '1',
        color: Colors.green),
    MenuCategory(
      title: 'Live Contest',
      icon: MdiIcons.trophy,
      count: '1',
      color: Colors.blueGrey,
      onTap: () {
        print('clicked');
      },
    ),
    MenuCategory(
        title: 'Fun \'N\' Learn',
        icon: MdiIcons.bookEducation,
        count: '1',
        color: Colors.orange),
  ];
  @override
  Widget build(BuildContext context) {
    // final widthScreen = MediaQuery.of(context).size.width;
    //  final heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
            childAspectRatio: MediaQuery.of(context).size.aspectRatio *
                3 /
                2, //(widthScreen / heightScreen),
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            children: <Widget>[
              ..._categorylist
                  .map(
                    (item) => MenuCategory(
                      title: item.title,
                      icon: item.icon,
                      color: item.color,
                      count: item.count,
                    ),
                  )
                  .toList(),
            ]),
      ),
    );
  }
}
