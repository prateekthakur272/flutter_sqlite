import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database.dart';
import 'package:flutter_sqlite/modals.dart';
import 'package:flutter_sqlite/view_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _name = TextEditingController();
    final _email = TextEditingController();
    final _phone = TextEditingController();

    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Flutter SQLite',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          CupertinoTextField(
            padding: const EdgeInsets.all(16),
            placeholder: 'Name',
            controller: _name,
          ),
          const SizedBox(
            height: 16,
          ),
          CupertinoTextField(
            padding: const EdgeInsets.all(16),
            placeholder: 'Email',
            controller: _email,
          ),
          const SizedBox(
            height: 16,
          ),
          CupertinoTextField(
            padding: const EdgeInsets.all(16),
            placeholder: 'Phone',
            controller: _phone,
          ),
          const SizedBox(
            height: 16,
          ),
          CupertinoButton.filled(
              child: const Text('Add'),
              onPressed: () {
                final name = _name.text.trim();
                final email = _email.text.trim();
                final phone = _phone.text.trim();

                if (name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty) {
                  DatabaseHelper.add(Person(name, email, phone)).then((value) {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Added'),
                            content: Text('$name added successfully'),
                            actions: [
                              CupertinoButton(
                                  child: const Text('Done'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ],
                          );
                        });
                  });
                  _name.clear();
                  _email.clear();
                  _phone.clear();
                } else {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Failed'),
                          content:
                              const Text('Can\'t add data with empty values'),
                          actions: [
                            CupertinoButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Close')),
                          ],
                        );
                      });
                }
              }),
          CupertinoButton(
              child: const Text('View persisted data'),
              onPressed: () async {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const ViewData()));
              })
        ],
      ),
    );
  }
}
