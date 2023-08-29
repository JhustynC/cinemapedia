import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  FullScreenLoader({super.key});

  final List<String> messagges = <String>[
    'Cargando Peliculas',
    'Llamando a la Policia',
    'Viendo la nada pensando en todo',
    'Esto se esta demorando',
    'Creo que yaaaa mismo',
    'Espera :) calladito'
  ];

  Stream<String> getLoadingMessages() {
    return Stream.periodic(
      const Duration(milliseconds: 1200),
      (step) {
        return messagges[step];
      },
    ).take(messagges.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere porfavor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
