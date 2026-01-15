import 'package:flutter/material.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';

class DatasetPreviewViewModel extends ChangeNotifier {
  DatasetDto? _dataset;
  List<dynamic>? _previewData;
  bool _isLoading = true;
  String? _errorMessage;

  DatasetDto? get dataset => _dataset;
  List<dynamic>? get previewData => _previewData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setDataset(DatasetDto dataset) {
    _dataset = dataset;
    notifyListeners();
  }

  void setPreviewData(List<dynamic> data) {
    _previewData = data;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clear() {
    _dataset = null;
    _previewData = null;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); 
  }
}