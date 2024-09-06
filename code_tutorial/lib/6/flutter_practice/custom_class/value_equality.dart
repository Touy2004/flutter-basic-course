class A {
  int value;
  A(this.value);

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is A && runtimeType == other.runtimeType && value == other.value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'A{value: $value}';
  }
}

void main() {
  print(A(1) == A(1));
  print(A(1));
}
