import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:ticket_scanner/bloc/just_check/just_check_bloc.dart';
import 'package:ticket_scanner/bloc/scan/scan_bloc.dart';
import 'package:ticket_scanner/bloc/screenings/screenings_bloc.dart';
import 'package:ticket_scanner/preferences.dart';
import 'package:ticket_scanner/view/pages/just_check_page.dart';
import 'package:ticket_scanner/view/pages/scan_page.dart';
import 'package:ticket_scanner/view/pages/screenings_page.dart';
import 'package:ticket_scanner/view/pages/secret_page.dart';

const String screeningsRoute = '/';
const String scanRoute = '/scan';
const String justCheckRoute = '/justCheck';
const String secretRoute = '/secret';
const String screeningArg = '/screening';

void main() async {
  await initApp();
  runApp(const MyApp());
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterLogs.initLogs(
      logLevelsEnabled: [LogLevel.INFO, LogLevel.WARNING, LogLevel.ERROR, LogLevel.SEVERE],
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.FOR_DATE,
      logTypesEnabled: ["device", "network", "errors"],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: "MyLogs",
      logsExportDirectoryName: "MyLogs/Exported",
      debugFileOperations: true,
      isDebuggable: true);

  await Preferences().init();
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
            case secretRoute:
              return const SecretPage();
            default:
              throw Exception('Unknown route');
          }
        },
      ),
    );
  }
}
