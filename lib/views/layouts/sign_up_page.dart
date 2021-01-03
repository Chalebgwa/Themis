import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simon/util/validator.dart';
import 'package:simon/views/components/logo.dart';
import 'package:simon/views/components/page_view_item.dart';
import 'package:simon/views/components/text_inputs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final PageController pageController = PageController();
  double currentPage = 0;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void next() async {
    //if (formKey.currentState.validate())
    await pageController.nextPage(
        duration: Duration(microseconds: 100), curve: Curves.bounceIn);
    setState(() {
      currentPage = pageController.page;
    });
  }

  void previous() async {
    await pageController.previousPage(
        duration: Duration(microseconds: 100), curve: Curves.bounceIn);
    setState(() {
      currentPage = pageController.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Container(
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/back3.jpg"),
                  fit: BoxFit.cover,
                  //alignment: Alignment.bottomRight,
                ),
              ),
            ),
            // BackdropFilter(
            //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            //   child: Container(
            //     color: Colors.black.withOpacity(.5),
            //   ),
            // ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Logo(
                      height: 70,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildIcon(FontAwesomeIcons.user, 0.0, "Personal Details"),
                      buildIcon(FontAwesomeIcons.phone, 1.0, "Phone Details"),
                      buildIcon(
                          FontAwesomeIcons.userLock, 2.0, "Account Details"),
                    ],
                  ),
                  Container(
                    height: size.height / 2.5,
                    child: Form(
                      key: formKey,
                      child: buildPageView(),
                    ),
                  ),
                  buildBottomButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(IconData iconData, index, label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: animateIcon(index),
          color: iconColor(index),
        ),
        if (currentPage == index)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              width: 70,
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Theme.of(context).accentColor)),
            ),
          )
      ],
    );
  }

  double animateIcon(double index) {
    if (currentPage == index) return 30;
    return 20;
  }

  Color iconColor(double index) {
    if (currentPage == index) return Theme.of(context).accentColor;
    return Colors.white;
  }

  PageView buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        PageViewItem(
          question: "Personal Details",
          inputs: [
            TextInput(
              label: "Firstname",
              validator: Validator.validateName,
              controller: firstnameController,
            ),
            TextInput(
              label: "Surname",
              validator: Validator.validateName,
              controller: lastController,
            ),
            TextInput(
              label: "Gender",
            ),
          ],
        ),
        PageViewItem(
          question: "Contact Details",
          inputs: [
            TextInput(
              label: "Email",
              validator: Validator.validateEmail,
            ),
            TextInput(
              label: "Phone",
              validator: Validator.validateNumber,
            ),
            TextInput(
              label: "Address",
              validator: Validator.validateName,
            ),
          ],
        ),
        PageViewItem(
          question: "Account Details",
          inputs: [
            TextInput(
              label: "Password",
              validator: Validator.validatePassword,
            ),
            TextInput(
              label: "Confirm Password",
              validator: Validator.validatePassword,
            ),
          ],
        ),
      ],
    );
  }

  Row buildBottomButtons() {
    print(currentPage);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (currentPage != 0.0)
          RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: previous,
            child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Icon(Icons.chevron_left),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        if (currentPage != 2.0)
          RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: next,
            child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Icon(Icons.chevron_right),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        if (currentPage == 2.0)
          RaisedButton(
            color: Theme.of(context).accentColor,
            onPressed: next,
            child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Text(
                "Confirm",
                style: TextStyle(
                  color: Theme.of(context).primaryColor
                ),
              ),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
      ],
    );
  }
}
