import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/views/components/clippers.dart';
import 'package:simon/views/layouts/admin_view.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key key,
    this.size = 70, this.borderColor=Colors.white,
  }) : super(key: key);

  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).currentUser;

    return Hero(
      tag: "ppc",
      child: GestureDetector(
        onTap: () {
          var route = MaterialPageRoute(
            builder: (_) => Profile(),
          );
          Navigator.push(context, route);
        },
        child: ClipPath(
          clipper: ProfileImageClipper(),
          child: Container(
            constraints: BoxConstraints(maxHeight: size, maxWidth: size),
            color: borderColor,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipPath(
                clipper: ProfileImageClipper(),
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/1.png"), fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
