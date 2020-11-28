import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  //nova atividade
  @observable
  String newTodoTitle = "";

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  //funcao que verifica se o campo esta vazio, entao ele desabilita o icone de +
  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  //list
  //@observable, QUANDO A LISTA É DO TIPO OBSERVABLELIST NÃO É NECESSARIA DECLARAR O TIPO COMO OBSERVABLE
  //List<String> todoList = List();
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  //funcao de add na lista
  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
    //todoList = List.from(todoList..add(newTodoTitle));
  }
}
