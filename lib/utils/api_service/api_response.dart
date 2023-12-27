class ApiResponse {
  int statusCode;
  String message;
  bool loading;

  ApiResponse(
      {this.loading = false, this.message = '', this.statusCode = 1000});

  ApiResponse copyWith({
    int? statusCode,
    String? message,
    bool? loading,
  }) =>
      ApiResponse(
          loading: loading ?? this.loading,
          message: message ?? this.message,
          statusCode: statusCode ?? this.statusCode);
}
