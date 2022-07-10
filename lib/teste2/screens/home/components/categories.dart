import 'package:flutter/material.dart';

import 'package:virtual_nature_app_tour/teste2/constants.dart';

class Categorylist extends StatefulWidget {
  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  int SelectedCategory = 0;
  List<String> categories = ["Em Alta", "Recomendados", "Explorados"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: GestureDetector(
          onTap: () {
            setState(() {
              SelectedCategory = index;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                categories[index],
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: index == SelectedCategory
                          ? kTextColor
                          : Colors.black.withOpacity(0.4),
                    ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                height: 6,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == SelectedCategory
                      ? kSecondaryColor
                      : Colors.transparent,
                ),
              )
            ],
          ),
        ));
  }
}
