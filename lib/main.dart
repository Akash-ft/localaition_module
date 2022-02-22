import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localaition/Provider/local_provider.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:provider/provider.dart";
import 'widget/picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "Localaition";

  // This widget is the root of your application.
  @override
  //Listens to a ChangeNotifier,
  // expose it to its descendants and rebuilds dependents whenever ChangeNotifier.notifyListeners is called.
  // Depending on whether you want to create or reuse a ChangeNotifier, you will want to use different constructors.
  // We use the localProvider to call the constructor.
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        //final provider variable is the data we requried to fetched
        //Provider is function that gets the value for you
        //This is a static method
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.amber,
            primaryColor: Colors.black,
          ),
          locale: provider.locale,
          //This a attribute to tell the app should support the list of language encoded.
          supportedLocales: L10n.all,
          //The delegates collectively define all of the localized resources for this application's Localizations widget.
          // Internationalized apps that require translations for one of the locales listed in GlobalMaterialLocalizations should specify this parameter
          // and list the supportedLocales that the application can handle.
          localizationsDelegates: [
            //generate appLocalization class
            AppLocalizations.delegate,
            //Transalation and support for material widgets
            GlobalMaterialLocalizations.delegate,
            //transalation and support for cupertino widgets
            GlobalCupertinoLocalizations.delegate,
            //To make view for different language for example arabic where the alignment will be in right to left.
            GlobalWidgetsLocalizations.delegate,
          ],
          home: Home(),
        );
      });
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          "Localization",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        actions: [
          LanguagePickerWidget(),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      backgroundColor: Colors.white10,
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Function to display the country selected or default lang country
              CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 50,
                child: LanguageWidget(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                //call the AppLocalization file and change the language based on device language or selected language
                //tell that it won't be Null.
                AppLocalizations.of(context)!.language,
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.helloWorld,
                style: TextStyle(color: Colors.amber, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
