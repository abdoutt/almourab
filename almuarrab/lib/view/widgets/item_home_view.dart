import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  ItemHome(
      {super.key,
      required this.imageItem,
      required this.title,
      required this.color,
      required this.tapfunction});
  String imageItem;
  String title;
  Color color;
  GestureTapCallback tapfunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapfunction,
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Image.asset(imageItem)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
