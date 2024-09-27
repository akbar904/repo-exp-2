
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.animal_switcher/cubits/animal_state.dart';

void main() {
	group('AnimalState', () {
		test('AnimalInitial is a subclass of AnimalState', () {
			expect(AnimalInitial(), isA<AnimalState>());
		});
		
		test('AnimalCat is a subclass of AnimalState', () {
			expect(AnimalCat(), isA<AnimalState>());
		});
		
		test('AnimalDog is a subclass of AnimalState', () {
			expect(AnimalDog(), isA<AnimalState>());
		});
	});
}
