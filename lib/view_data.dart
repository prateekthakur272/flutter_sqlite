import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text(
          'Persisted Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          CupertinoListTile(
            title: Text('Name'),
            subtitle: Text('Email'),
            leading: Icon(CupertinoIcons.person),
          ),
          CupertinoListTile(
            title: Text('Name'),
            subtitle: Text('Email'),
            leading: Icon(CupertinoIcons.person),
          ),
          CupertinoListTile(
            title: Text('Name'),
            subtitle: Text('Email'),
            leading: Icon(CupertinoIcons.person),
          ),
          CupertinoListTile(
            title: Text('Name'),
            subtitle: Text('Email'),
            leading: Icon(CupertinoIcons.person),
          ),
          CupertinoListTile(
            title: Text('Name'),
            subtitle: Text('Email'),
            leading: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
