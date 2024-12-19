import 'package:flutter/material.dart';
import '../utils/error_handler.dart';

class BaseProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;

  @protected
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  @protected
  void setError(String? error) {
    _error = error;
    notifyListeners();
  }

  @protected
  Future<T?> handleAsync<T>(Future<T> Function() task) async {
    try {
      setLoading(true);
      setError(null);
      final result = await task();
      return result;
    } catch (e) {
      setError(ErrorHandler.getErrorMessage(e));
      return null;
    } finally {
      setLoading(false);
    }
  }
}