import 'package:helloworld/model/note.dart';

abstract class StatesForNotesApp {}

class InitialStateForNotesApp extends StatesForNotesApp {}

class StateReadyForFetchingNotesData extends StatesForNotesApp {}

class StateFetchingNotesDataSuccessfully extends StatesForNotesApp {
  final List<Note> notes;

  StateFetchingNotesDataSuccessfully({required this.notes});
}

class StateFetchingNotesDataUnsuccessfully extends StatesForNotesApp {
  final String errorExp;

  StateFetchingNotesDataUnsuccessfully({required this.errorExp});
}

class StateReadyForAddNotesData extends StatesForNotesApp {}

class StateAddingNotesDataSuccessfully extends StatesForNotesApp {}

class StateAddNoteDataUnsuccessfully extends StatesForNotesApp {
  final String errorExp;

  StateAddNoteDataUnsuccessfully({required this.errorExp});
}

class StateReadyForDeleteNotesData extends StatesForNotesApp {}

class StateDeletingNotesDataSuccessfully extends StatesForNotesApp {}

class StateDeleteNoteDataUnsuccessfully extends StatesForNotesApp {
  final String errorExp;

  StateDeleteNoteDataUnsuccessfully({required this.errorExp});
}
