import 'dart:io';
import 'dart:math';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class Car {
  int id;
  String? brand;
  String? model;

  Car(this.id, this.brand, this.model);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
    };
  }
}

class CarApp {
  late Database _database;
  List<Car> cars = [];

  Future<Database> init() async {

    databaseFactory = databaseFactoryFfi;
    
    var databasesPath = await getDatabasesPath();
    final path = join(databasesPath,"../carscrud.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE carscrud(
            id INTEGER PRIMARY KEY,
            brand TEXT,
            model TEXT
          )
        ''');
      },
    );
  }

  Future<void> run() async {
    await init();

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
        await listCars();
      } else if (input == 'create' || input == '2') {
        await createCar();
      } else if (input == 'update' || input == '3') {
        await updateCar();
      } else if (input == 'delete' || input == '4') {
        await deleteCar();
      } else if (input == 'exit' || input == '0') {
        await _database.close();
        break;
      } else {
        print('Invalid option. Please try again.');
      }
    }
  }

  Future<void> listCars() async {
    var carsData = await _database.query('carscrud');
    cars = carsData.map((carMap) {
      return Car(
        carMap['id'] as int,
        carMap['brand'] as String?,
        carMap['model'] as String?,
      );
    }).toList();

    if (cars.isEmpty) {
      print('No cars found.');
    } else {
      print('Car List:');
      cars.forEach((car) {
        print('ID: ${car.id}, Brand: ${car.brand}, Model: ${car.model}');
      });
    }
  }

  Future<void> createCar() async {
    stdout.write('Enter car brand: ');
    String? brand = stdin.readLineSync();
    stdout.write('Enter car model: ');
    String? model = stdin.readLineSync();

    var randomID = Random();
    var car = Car(randomID.nextInt(1000), brand, model);

    await _database.insert(
      'cars',
      car.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print('Car created successfully.');
  }

  Future<void> updateCar() async {
    stdout.write('Enter car ID to update: ');
    String? input = stdin.readLineSync();
    int id = int.tryParse(input ?? '') ?? 0;

    int carIndex = cars.indexWhere((car) => car.id == id);
    if (
carIndex == -1) {
      print('Car with ID $id not found.');
    } else {
      stdout.write('Enter new car brand: ');
      String? brand = stdin.readLineSync();
      stdout.write('Enter new car model: ');
      String? model = stdin.readLineSync();

      Car carToUpdate = cars[carIndex];
      carToUpdate.brand = brand ?? carToUpdate.brand;
      carToUpdate.model = model ?? carToUpdate.model;

      await _database.update(
        'cars',
        carToUpdate.toMap(),
        where: 'id = ?',
        whereArgs: [carToUpdate.id],
      );

      print('Car updated successfully.');
    }
  }

  Future<void> deleteCar() async {
    stdout.write('Enter car ID to delete: ');
    String? input = stdin.readLineSync();
    int id = int.tryParse(input ?? '') ?? 0;

    int carIndex = cars.indexWhere((car) => car.id == id);
    if (carIndex == -1) {
      print('Car with ID $id not found.');
    } else {
      await _database.delete(
        'cars',
        where: 'id = ?',
        whereArgs: [id],
      );

      print('Car deleted successfully.');
    }
  }
}

void main() {
  CarApp carApp = CarApp();
  carApp.run();
}
