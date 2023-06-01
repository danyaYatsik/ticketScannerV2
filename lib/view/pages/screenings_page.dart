import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/bloc/screenings/screenings_bloc.dart';
import 'package:ticket_scanner/main.dart';
import 'package:ticket_scanner/view/widgets/screening_widget.dart';

class ScreeningsPage extends StatelessWidget {
  final textController = TextEditingController();

  ScreeningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ScreeningsBloc>();

    textController.addListener(() => bloc.add(ScreeningsEvent.search(textController.text)));

    return BlocBuilder<ScreeningsBloc, ScreeningsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state.isInSearchMode ? _searchAppBar(bloc) : _usualAppBar(bloc),
          body: Builder(
            builder: (context) {
              if (state.isScreeningsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: [
                  Flexible(
                    child: ListView.separated(
                      itemCount: state.searchedScreenings.length,
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            color: Colors.grey,
                            height: 1,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        final screening = state.searchedScreenings[index];
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(context, scanRoute, arguments: {screeningArg: screening}),
                          child: ListTile(
                            title: Text(screening.name),
                            subtitle: Text(screening.description),
                            dense: true,
                          ),
                          //child: ScreeningWidget(screening),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: MaterialButton(
                      onPressed: () => Navigator.pushNamed(context, justCheckRoute),
                      color: Colors.grey[400],
                      padding: const EdgeInsets.all(0),
                      minWidth: double.infinity,
                      child: Text('Просто чек'),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  AppBar _usualAppBar(Bloc bloc) => AppBar(
        title: const Text('Сеанси'),
        actions: [
          IconButton(
            onPressed: () => bloc.add(const ScreeningsEvent.toggleSearchMode()),
            icon: const Icon(Icons.search),
          ),
        ],
      );

  AppBar _searchAppBar(Bloc bloc) => AppBar(
        leading: const Icon(Icons.search),
        title: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
            ),
            controller: textController),
        actions: [
          IconButton(
            onPressed: () => bloc.add(const ScreeningsEvent.toggleSearchMode()),
            icon: const Icon(Icons.clear),
          ),
        ],
      );
}
