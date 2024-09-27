
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';
import 'package:animal_switcher/cubits/animal_state.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is AnimalCat', () {
			expect(animalCubit.state, isA<AnimalCat>());
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalDog] when toggleAnimal is called and current state is AnimalCat',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [isA<AnimalDog>()],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalCat] when toggleAnimal is called and current state is AnimalDog',
			build: () => animalCubit,
			seed: () => AnimalDog(),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [isA<AnimalCat>()],
		);
	});
}
