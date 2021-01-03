import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/appointment_provider.dart';
import 'package:simon/controllers/auth_provider.dart';
import 'package:simon/models/appointment.dart';
import 'package:simon/views/admin_view/appointment_view.dart';
import 'package:simon/views/components/logo.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    final nextApp = appointmentProvider.getNextAppointment();
    return buildHome(context, nextApp, size, appointmentProvider);
  }

  CustomScrollView buildHome(BuildContext context, Appointment nextApp,
      Size size, AppointmentProvider appointmentProvider) {

        final user = Provider.of<Auth>(context).currentUser;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.black38,
          leading: Logo(),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(user.imageUrl),

              ),
            )
          ],
        ),
        if (nextApp != null) buildUpNextCard(size, nextApp),
        buildApStream(appointmentProvider),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/icons/file.png",
                      color: Colors.grey,
                      height: 100,
                      width: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Cases",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        ButtonBar(
                          children: [
                            IconButton(
                              icon: Icon(FlutterIcons.addfile_ant),
                              onPressed: () {},
                              color: Theme.of(context).accentColor,
                            ),
                            IconButton(
                              icon: Icon(FlutterIcons.addfile_ant),
                              onPressed: () {},
                              color: Theme.of(context).accentColor,
                            ),
                            IconButton(
                              icon: Icon(FlutterIcons.addfile_ant),
                              onPressed: () {},
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  SliverToBoxAdapter buildApStream(AppointmentProvider appointmentProvider) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Today's Appointments",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          StreamBuilder<List<Appointment>>(
              stream: buildStream(appointmentProvider),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                return buildAPList(snapshot);
              }),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildUpNextCard(Size size, Appointment nextApp) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Up next",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                side: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
              ),
              child: InkWell(
                onTap: () {
                  var route = MaterialPageRoute(
                    builder: (_) => ViewAppointment(
                      appointment: nextApp,
                    ),
                  );
                  Navigator.push(context, route);
                },
                child: Container(
                  //color: Colors.red,
                  height: size.height / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Hero(
                          tag: "ipc" + nextApp.userid,
                          child: Material(
                            color: Colors.transparent,
                            child: CircularPercentIndicator(
                              progressColor: Theme.of(context).accentColor,
                              animation: true,
                              percent: .5,
                              startAngle: 0.0,
                              radius: 90,
                              center: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(nextApp.imageUrl),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                nextApp.userid,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Case#7758bhf",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    icon: Icon(FlutterIcons.API_ant),
                                    onPressed: () {},
                                    color: Theme.of(context).accentColor),
                                IconButton(
                                    icon: Icon(FlutterIcons.phone_ant),
                                    onPressed: () {},
                                    color: Theme.of(context).accentColor),
                                IconButton(
                                    icon: Icon(FlutterIcons.info_ant),
                                    onPressed: () {},
                                    color: Theme.of(context).accentColor),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<Appointment>> buildStream(AppointmentProvider provider) {
    return provider.mappedAppointments(DateTime.now());
  }

  Padding buildAPList(AsyncSnapshot<List<Appointment>> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 150,
          child: ListView.builder(
            itemCount: snapshot.data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final app = snapshot.data[i];
              final time = DateFormat.Hm().format(app.range.start);
              return buildAPCard(app, time);
            },
          )),
    );
  }

  Card buildAPCard(Appointment app, String time) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
        side: BorderSide(
          color: Theme.of(context).accentColor,
        ),
      ),
      child: InkWell(
        onTap: () {
          final route = MaterialPageRoute(
              builder: (c) => ViewAppointment(
                    appointment: app,
                  ));
          Navigator.push(context, route);
        },
        child: Container(
          width: 125,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: app,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(app.imageUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  app.userid,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
