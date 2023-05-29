import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/bloc/scan/scan_bloc.dart';
import 'package:ticket_scanner/bloc/screenings/screenings_bloc.dart';
import 'package:ticket_scanner/view/scan_page.dart';
import 'package:ticket_scanner/view/screenings_page.dart';

const String screeningsRoute = '/';
const String scanRoute = '/scan';
const String screeningArg = 'screening';

void main() {
  runApp(const MyApp());
}

//todo: implement router

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticket Scanner',
      initialRoute: screeningsRoute,
      onGenerateRoute: (settings) => MaterialPageRoute(
        settings: settings,
        builder: (context) {
          final arguments = settings.arguments as Map<String, dynamic>? ?? {};

          switch (settings.name) {
            case screeningsRoute:
              return BlocProvider(
                create: (context) => ScreeningsBloc()..add(const ScreeningsEvent.loadScreenings()),
                child: const ScreeningsPage(),
              );
            case scanRoute:
              final screening = arguments[screeningArg]!;
              return BlocProvider(
                create: (context) => ScanBloc(screening),
                child: const ScanPage(),
              );
            default: throw Exception('Unknown route');
          }
        },
      ),
    );
  }
}
