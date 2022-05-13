class ApiResponse<T> {
  ApiResponse({
    this.success = false,
    this.message,
    this.data,
  });

  bool success;
  String message;
  T data;
}
