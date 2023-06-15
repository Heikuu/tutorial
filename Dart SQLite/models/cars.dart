import 'config/table.dart';

/// # Car
/// carscrud table
///
/// @author HeinhtetLinn
class Car extends Table {
  /// The car id
  int id;

  /// The car brand
  String? brand;

  /// The car model
  String? model;

  /// ## constructor
  /// The user constructor with all arguments
  ///
  /// [Parameters]:
  ///  - id       [int]
  ///  - brand    [String]
  ///  - model  [String]
  Car(this.id, this.brand, this.model);

  /// [Map<String, dynamic>]
  ///
  /// @return [Car]
  Map<String, dynamic> toMap() {
    return {
      'id': id, //Type: int
      'brand': brand, //Type: String
      'model': model, //Type: String
    };
  }

  /// fromJson
  /// 
  /// the class factory method to convert json object to class member object
  /// 
  /// Parameters:
  /// - json [Map<String, dynamic>]
  /// 
  /// @return [User]
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(json['id'], json['brand'], json['model']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'brand': this.brand,
      'model': this.model,
    };
  }

  @override
  String createQuery() {
    return '''
    CREATE TABLE carscrud(
        id INTEGER PRIMARY KEY,
        brand TEXT,
        model TEXT
    )
    ''';
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
