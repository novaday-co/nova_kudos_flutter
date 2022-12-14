abstract class KodusException implements Exception {
  final String _message;
  final String _prefix;

  KodusException(this._message, this._prefix);

  @override
  String toString() {
    return _prefix + _message;
  }
}

class UnProcessableEntityException extends KodusException {
  UnProcessableEntityException({required String message})
      : super(message, "Invalid Request : ");
}

class NotFoundException extends KodusException {
  NotFoundException({required String message})
      : super(message, "Invalid Request : ");
}

class BadRequestException extends KodusException {
  BadRequestException({required String message})
      : super(message, "Invalid Request : ");
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

class ServerError extends KodusException {
  ServerError({required String message})
      : super(message, "Unknown error occurred : ");
}


