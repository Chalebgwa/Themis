import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/appointment_provider.dart';
import 'package:simon/controllers/artile_provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/controllers/chat_provider.dart';
import 'package:simon/util/enums.dart';
import 'package:simon/util/theme.dart';
import 'package:simon/views/admin_view/admin_view.dart';
import 'package:simon/views/layouts/landing_page.dart';
import 'package:simon/views/layouts/sign_in_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider<AppointmentProvider>(
          create: (context) => AppointmentProvider(),
        ),
        ChangeNotifierProvider<ArticleProvider>(
          create: (context) => ArticleProvider(),
        ),
        ChangeNotifierProvider<ChatProvider>(
          create: (context) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        theme: fancyLightTheme,
        debugShowCheckedModeBanner: false,
        title: 'Simon Law',
        home: Root(),
      ),
    );
  }
}

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  Auth auth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    auth = Provider.of<Auth>(context);
  }

  @override
  Widget build(BuildContext context) {
    switch (auth.state) {
      case AuthState.SIGNEDOUT:
        return SignIn();
      case AuthState.SIGNEDIN:
        if (auth.currentUser.isAdmin) {
          return AdminView();
        }

        return LandingPage();
      case AuthState.LOADING:
        return Scaffold(
          body: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        );
      default:
        return Container();
    }
  }
}
