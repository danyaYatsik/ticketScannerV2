import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/bloc/just_check/just_check_bloc.dart';
import 'package:ticket_scanner/bloc/scan/scan_bloc.dart';
import 'package:ticket_scanner/bloc/screenings/screenings_bloc.dart';
import 'package:ticket_scanner/view/pages/just_check_page.dart';
import 'package:ticket_scanner/view/pages/scan_page.dart';
import 'package:ticket_scanner/view/pages/screenings_page.dart';

const String screeningsRoute = '/';
const String scanRoute = '/scan';
const String justCheckRoute = '/justCheck';
const String screeningArg = 'screening';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Scanner',
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: screeningsRoute,
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) {
          final arguments = settings.arguments as Map<String, dynamic>? ?? {};

          switch (settings.name) {
            case screeningsRoute:
              return BlocProvider(
                create: (context) => ScreeningsBloc()..add(const ScreeningsEvent.loadScreenings()),
                child: ScreeningsPage(),
              );
            case scanRoute:
              final screening = arguments[screeningArg]!;
              return BlocProvider(
                create: (context) => ScanBloc(screening),
                child: const ScanPage(),
              );
            case justCheckRoute:
              return BlocProvider(
                create: (context) => JustCheckBloc(),
                child: const JustCheckPage(),
              );
            default:
              throw Exception('Unknown route');
          }
        },
      ),
    );
  }
}
