import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  final List<Item> items;
  final Function(List<Item>) updateBudget;
  final int budget;

  const Expenses({
    Key? key,
    required this.items,
    required this.updateBudget,
    required this.budget,
  }) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class Item {
  final String name;
  final int price;

  Item({required this.name, required this.price});
}

class _ExpensesState extends State<Expenses> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late int _budget;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _budget = widget.budget;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _showInputDialog(BuildContext context) async {
    String name = '';
    int price = 0;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: const Text(
              'Add Item',
              style: TextStyle(
                color: Colors.lightBlue,
              ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.lightBlue,
                  ),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                    labelText: 'Price',
                    labelStyle: TextStyle(
                      color: Colors.lightBlue,
                    ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  price = int.parse(value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.lightBlue,
                ),
              ),
              onPressed: () {
                setState(() {
                  final newItem = Item(name: name, price: price);
                  widget.items.add(newItem);
                  widget.updateBudget(widget.items);
                  _nameController.clear();
                  _priceController.clear();
                  _budget -= price; // Update the budget value
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expenses',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        color: Colors.purple[100],
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                _showInputDialog(context);
              },
              child: const Icon(Icons.add),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.items[index];
                  return Container(
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width:2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.deepPurple,
                    ),
                    child: ListTile(
                      title: Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                      subtitle: Text(
                          'Price: ${item.price}',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 15,
                            letterSpacing: 1,
                          ),
                      ),
                      trailing: IconButton(
                        color: Colors.lightBlue[200],
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            widget.items.remove(item);
                            _budget += item.price; // Update the budget value
                          });
                          widget.updateBudget(widget.items);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
                'Budget: $_budget',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 28,
                  letterSpacing: 1,
                ),
            ), // Display the updated budget value
          ],
        ),
      ),
    );
  }
}
