import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    /// use this instead of column, if you dont know the length of the data
    /// if you use column it will redender all the data, and that is high cost performance
    ///
    /// this example will create a scrollable list
    // return ListView(children: [],);

    // build the item only when it's visible
    return ListView.builder(
      itemBuilder: (context, index) => Text(expenses[index].title),
      itemCount: expenses.length,
    );
  }
}
