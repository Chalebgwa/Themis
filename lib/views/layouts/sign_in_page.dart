import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/views/components/logo.dart';
import 'package:simon/views/layouts/sign_up_page.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();

  final FocusNode emailFocusNode = new FocusNode();

  final FocusNode passFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, //.shade100,
        body: Stack(
          children: [
            buildTopContainer(size),
            Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 5,
                  child: Logo(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildField("Email", emailController, emailFocusNode),
                        _buildField(
                            "Password", passwordController, passFocusNode),
                        buildSignIn(auth),
                        buildOptions(auth, context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildTopContainer(Size size) {
    return Container(
      height: size.height,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage("assets/back3.jpg"),
          fit: BoxFit.cover,

          // alignment: Alignment.bottomRight,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(.5),
      ),
    );
  }

  Widget _buildField(
      String hint, TextEditingController controller, FocusNode node) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        focusNode: node,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          fillColor: Colors.grey.shade700.withOpacity(.5),
          filled: true,
          hintStyle: TextStyle(color: Colors.white),
          hintText: hint,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade100,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignIn(Auth auth) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          RaisedButton(
            elevation: 100,
            color: Theme.of(context).accentColor,
            onPressed: () {
              auth.signIn("email", "",isAdmin: false);
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Icon(FontAwesomeIcons.signInAlt),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          RaisedButton(
            elevation: 100,
            color: Colors.red,
            onPressed: () {
              auth.signIn("email", "");
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text("Test Admnin"),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildOptions(Auth auth, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlatButton.icon(
            //color: Colors.white,
            icon: Icon(
              FontAwesomeIcons.userEdit,
              size: 10,
              color: Colors.black,
            ),
            onPressed: () {
              var route = MaterialPageRoute(builder: (_) => SignUp());
              Navigator.push(context, route);
            },
            label: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          FlatButton(
            //color: Colors.white,
            onPressed: () {},
            child: Text(
              "Forgot Password",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
