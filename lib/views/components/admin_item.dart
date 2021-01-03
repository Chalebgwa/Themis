import 'package:flutter/material.dart';

class AdminItem extends StatelessWidget {
  const AdminItem({Key key, this.imageIcon, this.title}) : super(key: key);

  final String imageIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 50,
              left: 50,
              height: 170,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageIcon,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  backgroundColor: Colors.white,
                  elevation: 3,
                  label: Text(
                    "30",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              bottom: 0,
              left: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
