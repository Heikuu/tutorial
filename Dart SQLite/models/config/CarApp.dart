import 'dart:io';
import 'dart:math';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

import '../../index.dart';
import 'table.dart';
import '../../models/cars.dart';

/// # CarApp
/// The CarApp class to use for analysis the database
///
/// @author HeinhtetLinn
class CarApp {
  late Database _database;
  List<Car> cars = [];

  /// To initialize the database
  ///
  Future<Database> init() async {
    databaseFactory = databaseFactoryFfi;

  /// Get the database's table names
  ///
    var databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "../carscrud.db");

    /// get the current database
    ///
    /// @return [Database]
  Database get database => _database;
  }
}
