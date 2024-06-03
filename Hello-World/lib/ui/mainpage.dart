import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/cubitfornotesapp.dart';
import 'package:helloworld/cubit/statesfornoteapp.dart';
import 'package:helloworld/model/note.dart';

class MainPage extends StatefulWidget {
  
  /*
    زينب ياسين ابراهيم
  */
  
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<FormState> keyForForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        
        /*
              حيدره عبد اللطيف ابراهيم
        */
        
        title: Form(
            key: keyForForm,
            child: Column(children: [
              const Text(
                "Notes",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                height: 5,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
                autofocus: true,
                controller: context.read<CubitForNoteApp>().contentController,
                minLines: 2,
                maxLines: 6,
                maxLength: 96,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  
                  /*
                    مها مهند التقي
                  */
                  
                  filled: true,
                  fillColor: Colors.limeAccent[100],
                  hintText: "Enter note content",
                  prefixIcon: const Icon(Icons.note_add),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.amber),
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ),
              Container(
                height: 5,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
                controller: context.read<CubitForNoteApp>().categoryController,
                decoration: InputDecoration(
                  
                  /*
                    خاتون اياد بدرية
                  */
                  
                  filled: true,
                  fillColor: Colors.limeAccent[100],
                  hintText: "Enter category",
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.amber),
                    borderRadius: BorderRadius.circular(21),
                  ),
                ),
              ),
            ])),
        actions: [
          IconButton(
              onPressed: () {
                if (keyForForm.currentState!.validate()) {
                  context.read<CubitForNoteApp>().addNewNote();
                  context.read<CubitForNoteApp>().fetchingNotesData();
                }
              },
              icon: const Icon(Icons.add, color: Colors.white, size: 25)),
          ElevatedButton(
            onPressed: () {
              
              /*
                    ديمه علاء الدين رجب
              */
              
              context.read<CubitForNoteApp>().someNoteData();
              context.read<CubitForNoteApp>().fetchingNotesData();
            },
            child: const Text("Populate", style: TextStyle(fontSize: 10)),
          ),
        ],
        backgroundColor: Colors.orange,
      ),
      body: BlocBuilder<CubitForNoteApp, StatesForNotesApp>(
        builder: (context, state) {
          if (state is StateReadyForFetchingNotesData) {
            return const LinearProgressIndicator();
          } else if (state is StateFetchingNotesDataSuccessfully) {
            List<Note> notes = state.notes;
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          context
                              .read<CubitForNoteApp>()
                              .deleteNote(id: notes[index].id!);
                          context.read<CubitForNoteApp>().fetchingNotesData();
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.blue,
                        ),
                      ),
                      leading: Text("${notes[index].id}"),
                      title: Text(notes[index].content),
                      subtitle: Text(notes[index].category),
                    ),
                  );
                });
          } else if (state is StateFetchingNotesDataUnsuccessfully) {
            return Text(state.errorExp);
          } else if (state is StateAddingNotesDataSuccessfully) {
            return const Text("Note was added successfully!");
          } else if (state is StateDeletingNotesDataSuccessfully) {
            return const Text("Note was deleted successfully");
          }
          return const Text("Undefined State!");
        },
      ),
    );
  }
}
