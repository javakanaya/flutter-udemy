import 'package:uuid/uuid.dart';

// const value so it can't be reassigned
const uuid = Uuid();

// no need quoote, but darts treat it kind a as string
enum Category { food, travel, leisure, work }

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      // initialize id where the value are not from the constructor function argument
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
