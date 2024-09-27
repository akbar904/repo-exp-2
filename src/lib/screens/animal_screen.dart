
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/cubits/animal_state.dart';
import 'package:animal_switcher/widgets/animal_text.dart';

class AnimalScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Animal Switcher'),
			),
			body: Center(
				child: BlocBuilder<AnimalCubit, AnimalState>(
					builder: (context, state) {
						IconData icon;
						String text;

						if (state is AnimalCat) {
							icon = Icons.access_time;
							text = 'Cat';
						} else if (state is AnimalDog) {
							icon = Icons.person;
							text = 'Dog';
						} else {
							icon = Icons.help;
							text = 'Unknown';
						}

						return GestureDetector(
							onTap: () => context.read<AnimalCubit>().toggleAnimal(),
							child: AnimalText(
								text: text,
								icon: icon,
							),
						);
					},
				),
			),
		);
	}
}
