
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/models/animal.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should have correct name and icon', () {
			const animalName = 'Cat';
			const animalIcon = Icons.pets;

			final animal = Animal(name: animalName, icon: animalIcon);

			expect(animal.name, equals(animalName));
			expect(animal.icon, equals(animalIcon));
		});

		test('Animal model should serialize and deserialize correctly', () {
			const animalName = 'Dog';
			const animalIcon = Icons.person;
			final animal = Animal(name: animalName, icon: animalIcon);

			final json = animal.toJson();
			final deserializedAnimal = Animal.fromJson(json);

			expect(deserializedAnimal.name, equals(animalName));
			expect(deserializedAnimal.icon, equals(animalIcon));
		});
	});
}
