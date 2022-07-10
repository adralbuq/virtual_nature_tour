import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/movie.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: kDefaultPadding / 2),
                  Row(
                    children: <Widget>[
                      Text(
                        "Destino de Natureza",
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.location_on,
                    size: 28,
                    color: Colors.white,
                  ),
                ))
          ],
        ));
  }
}
