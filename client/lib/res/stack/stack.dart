class MyStack<E> {
  final _list = <E>[];

  void push(E value) => _list.add(value);

  int size() => _list.length;

  E pop() => _list.removeLast();

  E get(int index) => _list[index];

  E get peek => _list.last;

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();

  // E? pop() => (isEmpty) ? null : _list.removeLast();
  //
  // E? get peek => (isEmpty) ? null : _list.last;
}