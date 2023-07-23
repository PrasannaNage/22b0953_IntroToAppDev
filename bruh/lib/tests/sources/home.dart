import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final int budget;

  const Home({Key? key, required this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Budget Tracker',
          style: TextStyle(
            fontSize: 28,
            letterSpacing: 1.5,
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        color: Colors.purple[100],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.freeiconspng.com/img/898'),
                  backgroundColor: Colors.white,
                  radius: 80,
                ),
                const SizedBox(height: 40),
                Column(
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.purple[900],
                        fontSize: 28,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                        color: Colors.purple[900],
                        fontSize: 28,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.deepPurple,
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  margin: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 140),
                      Text(
                        '$budget',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/expenses');
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
