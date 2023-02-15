class DynamicFormException {
  final String message;
  final StackTrace stackTrace;

  const DynamicFormException({
    required this.message,
    required this.stackTrace,
  });

  @override
  String toString() {
    return '$runtimeType: $message\n$stackTrace';
  }
}

class UnregisteredFieldException extends DynamicFormException {
  const UnregisteredFieldException({
    required super.message,
    required super.stackTrace,
  });
}
