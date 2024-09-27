
import 'package:flutter_test/flutter_test.dart';
import 'package:animal_switcher/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
	group('Main Function Tests', () {
		testWidgets('App initializes and displays AnimalScreen', (tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(AnimalScreen), findsOneWidget);
		});
	});
}
