import 'package:flutter/material.dart';
import 'package:flutter_colleage/arzoo%20sir/models/note.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  TextEditingController titleTxtCntrl = TextEditingController();
  TextEditingController descTxtCntrl = TextEditingController();

  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Notes"))),
      body: Column(
        children: [
          //* add
          TextField(
            controller: titleTxtCntrl,
            decoration: InputDecoration(
              hintText: "Enter The Title",
              labelText: "Title",
            ),
          ),
          TextField(
            controller: descTxtCntrl,
            decoration: InputDecoration(
              hintText: "Enter Description",
              labelText: "Description",
            ),
          ),

          ElevatedButton(
            //! if state varible have some update which is not avialbe on ui or output that condition is knows as dirty state
            onPressed: () {
              if (titleTxtCntrl.text.isNotEmpty &&
                  descTxtCntrl.text.isNotEmpty) {
                notes.add(
                  Note(
                    id: DateTime.now().toIso8601String(),
                    title: titleTxtCntrl.text,
                    description: descTxtCntrl.text,
                  ),
                );
                titleTxtCntrl.clear();
                descTxtCntrl.clear();
                setState(() {});
              }
            },
            child: Text("Add"),
          ),

          //* display
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(notes[index].title),
                  subtitle: Text(notes[index].description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      notes.remove(notes[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
