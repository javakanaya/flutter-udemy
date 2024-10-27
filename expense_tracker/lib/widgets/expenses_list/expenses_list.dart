import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    /// use this instead of column, if you dont know the length of the data
    /// if you use column it will redender all the data, and that is high cost performance
    ///
    /// this example will create a scrollable list
    // return ListView(children: [],);

    // build the item only when it's visible
    return ListView.builder(
      // arrow function

      itemBuilder: (context, index) =>
          // to get the swiping delete effect
          Dismissible(
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              background: Container(
                margin: Theme.of(context).cardTheme.margin,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              key: ValueKey(expenses[index]),
              child: ExpenseItem(expenses[index])),
      itemCount: expenses.length,
    );
  }
}
