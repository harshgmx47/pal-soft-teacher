import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class MenuCategory extends StatelessWidget {
  const MenuCategory(
      {Key? key,
      required this.title,
      required this.icon,
      this.count,
      required this.color,
      this.onTap})
      : super(key: key);
  final String title;
  final String? count;
  final IconData icon;
  final VoidCallback? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * (.080),
            width: MediaQuery.of(context).size.width * (.180),
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                icon,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Center(
                  child: Text(title,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Center(
                  child: Text(
                    count!,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
