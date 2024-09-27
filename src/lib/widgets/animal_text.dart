
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/models/animal.dart';

class AnimalText extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				context.read<AnimalCubit>().toggleAnimal();
			},
			child: BlocBuilder<AnimalCubit, AnimalState>(
				builder: (context, state) {
					if (state is AnimalCat) {
						return Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Text('Cat'),
								Icon(Icons.access_time),
							],
						);
					} else if (state is AnimalDog) {
						return Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Text('Dog'),
								Icon(Icons.person),
							],
						);
					} else {
						return SizedBox.shrink();
					}
				},
			),
		);
	}
}
