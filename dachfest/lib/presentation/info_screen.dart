import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _header(context),
        _tickets(context),
        _location(context),
        _aboutApp(context),
      ],
    );
  }

  Widget _location(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Location",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Main campus of the Munich Technical University (TU Munich).",
            style: Theme.of(context).textTheme.body1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Text(
              "Arcisstraße 21, 80333 Munich, Germany",
              style: Theme.of(context).accentTextTheme.subhead.copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).accentColor,
                  ),
            ),
            onTap: () => _launchURL(
                'https://www.google.com/maps/dir/?api=1&destination=48.148214,11.5505653'),
          ),
        )
      ],
    );
  }

  Widget _aboutApp(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "About the App",
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "This app is 100% Flutter!",
                  ),
                  FlutterLogo(),
                ],
              ),
            ),
            Text("Made with ❤️ by Lara Martín and Miquel Beltran."),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                child: Text(
                  "GitHub Repository Source",
                  style: Theme.of(context).accentTextTheme.subhead.copyWith(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                onTap: () => _launchURL('https://github.com/KawaiiTech/dachfest-flutter-app'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                child: Text(
                  "laramartin.eu",
                  style: Theme.of(context).accentTextTheme.subhead.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).accentColor,
                      ),
                ),
                onTap: () => _launchURL('http://laramartin.eu'),
              ),
            ),
            InkWell(
              child: Text(
                "beltran.work",
                style: Theme.of(context).accentTextTheme.subhead.copyWith(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).accentColor,
                    ),
              ),
              onTap: () => _launchURL('http://beltran.work'),
            ),
          ]),
    );
  }

  Widget _tickets(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Text(
              "dachfest.com",
              style: Theme.of(context).accentTextTheme.subhead.copyWith(
                decoration: TextDecoration.underline,
                color: Theme.of(context).accentColor,
              ),
            ),
            onTap: () => _launchURL('https://dachfest.com'),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "The human side of tech",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "DACHFest is a two-day conference focused on making a "
                "difference. Discover all the different ways in which emerging "
                "technology is transforming lives, find out how to make your apps "
                "and websites friendly towards everyone, learn the secrets of "
                "building and nurturing a diverse community — let our speakers "
                "surprise and inspire you! And don't forget to make new friends: "
                "there will be plenty of opportunities to meet people passionate "
                "about your favorite things. ❤️",
            style: Theme.of(context).textTheme.body1,
          ),
        ),
      ],
    );
  }
}
