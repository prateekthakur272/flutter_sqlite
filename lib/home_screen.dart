import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/view_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Flutter SQLite',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const CupertinoTextField(
            padding: EdgeInsets.all(16),
            placeholder: 'Name',
          ),
          const SizedBox(
            height: 16,
          ),
          const CupertinoTextField(
            padding: EdgeInsets.all(16),
            placeholder: 'Email',
          ),
          const SizedBox(
            height: 16,
          ),
          const CupertinoTextField(
            padding: EdgeInsets.all(16),
            placeholder: 'Phone',
          ),
          const SizedBox(
            height: 16,
          ),
          CupertinoButton.filled(
              child: const Text('Add'),
              onPressed: () {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('Added'),
                        content: const Text('Data added successfully'),
                        actions: [
                          CupertinoButton(
                              child: const Text('Done'),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ],
                      );
                    });
              }),
          CupertinoButton(
              child: const Text('View persisted data'),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const ViewData()));
              })
        ],
      ),
    );
  }
}
