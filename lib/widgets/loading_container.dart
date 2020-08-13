import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: buildContainer(),
          subtitle: buildContainer(),
        ),
        Divider(height: 15),
      ],
    );
  }

  Widget buildContainer(){
    return Container(
      color: Colors.grey[200],
      height: 24.0,
      width: 150.0,
      margin: EdgeInsets.all(5.0),
    );
  }
}