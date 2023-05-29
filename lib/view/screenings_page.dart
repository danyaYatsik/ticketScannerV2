import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/bloc/screenings/screenings_bloc.dart';
import 'package:ticket_scanner/main.dart';
import 'package:ticket_scanner/view/screening_widget.dart';

class ScreeningsPage extends StatelessWidget {
  const ScreeningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сеанси'),
      ),
      body: BlocBuilder<ScreeningsBloc, ScreeningsState>(
        builder: (context, state) {
          if (state.isScreeningsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final screenings = state.screenings;

          if (screenings == null) {
            return const Center(
              child: Text('Упс... Щось пiшло не так'),
            );
          }

          return ListView.separated(
            itemCount: screenings.length,
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              );
            },
            itemBuilder: (context, index) {
              final screening = screenings[index];
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, scanRoute, arguments: {screeningArg: screening}),
                child: ScreeningWidget(screening),
              );
            },
          );
        },
      ),
    );
  }
}
