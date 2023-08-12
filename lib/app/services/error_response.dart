class ErrorResponse {
  ErrorResponse({
    this.errors,
    this.message,
    this.name,
    this.errorResponseMessage,
  });

  final Errors? errors;
  final String? message;
  final String? name;
  final String? errorResponseMessage;

  ErrorResponse copyWith({
    Errors? errors,
    String? message,
    String? name,
    String? errorResponseMessage,
  }) =>
      ErrorResponse(
        errors: errors ?? this.errors,
        message: message ?? this.message,
        name: name ?? this.name,
        errorResponseMessage: errorResponseMessage ?? this.errorResponseMessage,
      );

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
        message: json["_message"],
        name: json["name"],
        errorResponseMessage: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "errors": errors?.toJson(),
        "_message": message,
        "name": name,
        "message": errorResponseMessage,
      };
}

class Errors {
  Errors({
    this.email,
    this.password,
    this.phoneNumber,
    this.gender,
    this.fullName,
    this.membership,
    this.address,
    this.dateOfBirth,
    this.babyName,
  });

  final ApiError? email;
  final ApiError? password;
  final ApiError? phoneNumber;
  final ApiError? gender;
  final ApiError? fullName;
  final ApiError? membership;
  final ApiError? address;
  final ApiError? dateOfBirth;
  final ApiError? babyName;

  Errors copyWith({
    ApiError? email,
    ApiError? password,
    ApiError? phoneNumber,
    ApiError? gender,
    ApiError? fullName,
    ApiError? membership,
    ApiError? address,
    ApiError? dateOfBirth,
    ApiError? babyName,
  }) =>
      Errors(
        email: email ?? this.email,
        password: password ?? this.password,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        gender: gender ?? this.gender,
        fullName: fullName ?? this.fullName,
        membership: membership ?? this.membership,
        address: address ?? this.address,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        babyName: babyName ?? this.babyName,
      );

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] == null ? null : ApiError.fromJson(json["email"]),
        password: json["password"] == null
            ? null
            : ApiError.fromJson(json["password"]),
        phoneNumber: json["phoneNumber"] == null
            ? null
            : ApiError.fromJson(json["phoneNumber"]),
        gender:
            json["gender"] == null ? null : ApiError.fromJson(json["gender"]),
        fullName: json["fullName"] == null
            ? null
            : ApiError.fromJson(json["fullName"]),
        membership: json["membership"] == null
            ? null
            : ApiError.fromJson(json["membership"]),
        address:
            json["address"] == null ? null : ApiError.fromJson(json["address"]),
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : ApiError.fromJson(json["dateOfBirth"]),
        babyName: json["babyName"] == null
            ? null
            : ApiError.fromJson(json["babyName"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email?.toJson(),
        "password": password?.toJson(),
        "phoneNumber": phoneNumber?.toJson(),
        "gender": gender?.toJson(),
        "fullName": fullName?.toJson(),
        "membership": membership?.toJson(),
        "address": address?.toJson(),
        "dateOfBirth": dateOfBirth?.toJson(),
        "babyName": babyName?.toJson(),
      };
}

class ApiError {
  ApiError({
    this.name,
    this.message,
    this.properties,
    this.kind,
    this.path,
    this.value,
  });

  final String? name;
  final String? message;
  final Properties? properties;
  final String? kind;
  final String? path;
  final String? value;

  ApiError copyWith({
    String? name,
    String? message,
    Properties? properties,
    String? kind,
    String? path,
    String? value,
  }) =>
      ApiError(
        name: name ?? this.name,
        message: message ?? this.message,
        properties: properties ?? this.properties,
        kind: kind ?? this.kind,
        path: path ?? this.path,
        value: value ?? this.value,
      );

  factory ApiError.fromJson(Map<String, dynamic> json) => ApiError(
        name: json["name"],
        message: json["message"],
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
        kind: json["kind"],
        path: json["path"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
        "properties": properties?.toJson(),
        "kind": kind,
        "path": path,
        "value": value,
      };
}

class Properties {
  Properties({
    this.message,
    this.type,
    this.path,
    this.value,
  });

  final String? message;
  final String? type;
  final String? path;
  final String? value;

  Properties copyWith({
    String? message,
    String? type,
    String? path,
    String? value,
  }) =>
      Properties(
        message: message ?? this.message,
        type: type ?? this.type,
        path: path ?? this.path,
        value: value ?? this.value,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        message: json["message"],
        type: json["type"],
        path: json["path"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "type": type,
        "path": path,
        "value": value,
      };
}
