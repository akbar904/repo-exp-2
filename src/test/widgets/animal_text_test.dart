
// test/widgets/animal_text_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animal_switcher/widgets/animal_text.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/models/animal.dart';

class MockAnimalCubit extends Mock implements AnimalCubit {}

void main() {
	group('AnimalText Widget', () {
		testWidgets('displays a cat with a clock icon initially', (WidgetTester tester) async {
			final mockAnimalCubit = MockAnimalCubit();
			when(() => mockAnimalCubit.state).thenReturn(AnimalCat());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: Scaffold(
							body: AnimalText(),
						),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays a dog with a person icon when state is AnimalDog', (WidgetTester tester) async {
			final mockAnimalCubit = MockAnimalCubit();
			when(() => mockAnimalCubit.state).thenReturn(AnimalDog());

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: Scaffold(
							body: AnimalText(),
						),
					),
				),
			);

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('toggles between cat and dog on tap', (WidgetTester tester) async {
			final mockAnimalCubit = MockAnimalCubit();
			when(() => mockAnimalCubit.state).thenReturn(AnimalCat());
			when(() => mockAnimalCubit.toggleAnimal()).thenAnswer((_) {
				when(() => mockAnimalCubit.state).thenReturn(AnimalDog());
			});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => mockAnimalCubit,
						child: Scaffold(
							body: AnimalText(),
						),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			verify(() => mockAnimalCubit.toggleAnimal()).called(1);

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
