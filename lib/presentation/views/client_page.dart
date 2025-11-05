import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_client/domain/entities/client.dart';
import 'package:http_client/injection.dart';
import 'package:http_client/presentation/state/client_bloc.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClientBloc>(),
      child: const ClientView(),
    );
  }
}

class ClientView extends StatelessWidget {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyClient = Client(
      id: "1",
      name: 'John Doe Updated',
      email: 'john.doe.updated@example.com',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Client')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ClientBloc, ClientState>(
                  builder: (context, state) {
                    if (state is ClientInitial || state is ClientSuccess) {
                      return Text(
                        state is ClientSuccess
                            ? state.message
                            : 'Press a button to start.',
                      );
                    } else if (state is ClientLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is ClientLoaded) {
                      return Column(
                        children: [
                          Text('ID: ${state.client.id}'),
                          Text('Name: ${state.client.name}'),
                          Text('Email: ${state.client.email}'),
                        ],
                      );
                    } else if (state is ClientError) {
                      return Text(
                        'Error: ${state.message}',
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<ClientBloc>().add(const GetClient("1"));
                      },
                      child: const Text('Fetch Client 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final newClient = Client(
                          id: "3",
                          name: 'Jane Doe',
                          email: 'jane.doe@example.com',
                        );
                        context.read<ClientBloc>().add(CreateClient(newClient));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Create Client'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ClientBloc>().add(
                          UpdateClient(dummyClient),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text('Update Client 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ClientBloc>().add(const DeleteClient("2"));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Delete Client 2'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
