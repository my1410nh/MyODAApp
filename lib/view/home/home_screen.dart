import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myodaapp/viewmodel/events_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventsViewModel = Provider.of<EventsViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Column(
        children: [
          Text('Events:'),
          Consumer<EventsViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.events.isEmpty) {
                return Center(child: Text('No events available.'));
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.events.length,
                itemBuilder: (context, index) {
                  final event = viewModel.events[index];
                  return Card(
                    child: ListTile(
                      title: Text(event['name']),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
