import 'dart:io';

class Car {
  int id;
  String? brand;
  String? model;

  Car({required this.id, this.brand, this.model});
}

class CarApp {
  List<Car> cars = [];
  int _nextId = 1;

  void run() {
    print('Car Management System');
    print('Available Options:');
    print('1. list     - to display the list of cars');
    print('2. create   - to create a new car');
    print('3. update   - to update a car');
    print('4. delete   - to delete a car');
    print('0. exit     - to exit the program');

    while (true) {
      stdout.write('\nEnter your choice: ');
      String? input = stdin.readLineSync();

      if (input == 'list' || input == '1') {
        listCars();
      } else if (input == 'create' || input == '2') {
        createCar();
      } else if (input == 'update' || input == '3') {
        updateCar();
      } else if (input == 'delete' || input == '4') {
        deleteCar();
      } else if (input == 'exit' || input == '0') {
        break;
      } else {
        print('Invalid option. Please try again.');
      }
    }
  }

  void listCars() {
    if (cars.isEmpty) {
      print('No cars found.');
    } else {
      print('Car List:');
      cars.forEach((car) {
        print('ID: ${car.id}, Brand: ${car.brand}, Model: ${car.model}');
      });
    }
  }

  void createCar() {
    stdout.write('Enter car brand: ');
    String? brand = stdin.readLineSync();
    stdout.write('Enter car model: ');
    String? model = stdin.readLineSync();

    Car newCar = Car(id: _nextId, brand: brand, model: model);
    cars.add(newCar);
    _nextId++;

    print('Car created successfully.');
  }

  void updateCar() {
    stdout.write('Enter car ID to update: ');
    String? input = stdin.readLineSync();
    int id = int.tryParse(input!) ?? 0;

    int carIndex = cars.indexWhere((car) => car.id == id);
    if (carIndex == -1) {
      print('Car with ID $id not found.');
    } else {
      stdout.write('Enter new car brand: ');
      String? brand = stdin.readLineSync();
      stdout.write('Enter new car model: ');
      String? model = stdin.readLineSync();

      Car carToUpdate = cars[carIndex];
      carToUpdate.brand = brand ?? carToUpdate.brand;
      carToUpdate.model = model ?? carToUpdate.model;

      print('Car updated successfully.');
    }
  }

  void deleteCar() {
    stdout.write('Enter car ID to delete: ');
    String? input = stdin.readLineSync();
    int id = int.tryParse(input!) ?? 0;

    int carIndex = cars.indexWhere((car) => car.id == id);
    if (carIndex == -1) {
      print('Car with ID $id not found.');
    } else {
      cars.removeAt(carIndex);
      print('Car deleted successfully.');
    }
  }
}

void main() {
  CarApp carApp = CarApp();
  carApp.run();
}
