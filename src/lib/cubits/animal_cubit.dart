
import 'package:flutter_bloc/flutter_bloc.dart';
import 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalCat());

	void toggleAnimal() {
		if (state is AnimalCat) {
			emit(AnimalDog());
		} else {
			emit(AnimalCat());
		}
	}
}
