
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/animal_screen.dart';
import 'cubits/animal_cubit.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Animal Switcher',
			home: BlocProvider(
				create: (context) => AnimalCubit(),
				child: AnimalScreen(),
			),
		);
	}
}
