import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;

    //with the widget proporty, i can acces the function from the widget class, inside of the stateclass.
    widget.addTx(_titleController.text, double.parse(_amountController.text),_selectedDate);

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    //showDatePicker returns a future. A future is an object which is not defined in current time, but will be later on. ex when the date has been picked.
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: 'Groceries',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  )),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: '29.99',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  )),
              controller: _amountController,
              keyboardType: TextInputType.number,
              //the '_' is indicating that i dont use the value passed in by the function.
              onSubmitted: (_) => _submitData(),
              // onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style: Theme.of(context).textTheme.button,
              ),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
