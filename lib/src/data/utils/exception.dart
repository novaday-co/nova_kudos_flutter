abstract class KodusException implements Exception {
  final String _message;
  final String _prefix;

  KodusException(this._message, this._prefix);

  @override
  String toString() {
    return _prefix + _message;
  }
}

class CompleteProfileException extends KodusException {
  CompleteProfileException({required String message})
      : super(message, "Complete profile : ");
}

class AccessDeniedException extends KodusException {
  AccessDeniedException({required String message})
      : super(message, "Access denied : ");
}

class UnauthorizedException extends KodusException {
  UnauthorizedException({required String message})
      : super(message, "UnAuthorized Exception : ");
}


