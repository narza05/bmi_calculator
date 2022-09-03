import 'package:flutter/material.dart';


class Reusecontainer extends StatelessWidget {
  Reusecontainer(this.colors, this.container_child,this.onpress);

  final Color colors;
  final Widget container_child;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onpress(),
      child: Container(
        child: container_child,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
      ),
    );
  }
}