import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
            onPressed: () {
              DatabaseHelper.deleteAll();
              setState(() {});
            },
            child: const Icon(CupertinoIcons.delete)),
        middle: const Text(
          'Persisted Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: FutureBuilder(
            future: DatabaseHelper.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Text('There is currently no data');
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => CupertinoListTile(
                    title: Text(snapshot.data![index].name),
                    leading: const Icon(CupertinoIcons.person_fill),
                    subtitle: Text(snapshot.data![index].email),
                    onTap: () {
                      DatabaseHelper.delete(snapshot.data![index].id);
                      setState(() {});
                    },
                  ),
                );
              }
              return const CupertinoActivityIndicator();
            }),
      ),
    );
  }
}
