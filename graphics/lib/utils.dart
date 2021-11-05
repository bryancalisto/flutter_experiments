import 'dart:collection';

class Stack<T> {
  final Queue<T> _queue = Queue<T>();

  bool get isEmpty => _queue.isEmpty;

  T pop() {
    final T lastItem = _queue.last;
    _queue.removeLast();
    return lastItem;
  }

  void push(T item) {
    _queue.addLast(item);
  }
}
