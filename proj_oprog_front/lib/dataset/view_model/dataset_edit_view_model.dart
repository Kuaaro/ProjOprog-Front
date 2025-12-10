import 'package:flutter/foundation.dart';
import 'package:proj_oprog_front/dataset/dto/dataset_dto.dart';
import 'package:proj_oprog_front/dataset/dto/distribution_dto.dart';

import 'package:proj_oprog_front/shared/dtos/named_id_pair.dart';

class DatasetEditViewModel extends ChangeNotifier {
  DatasetDto? _dataset;
  bool _isLoading = false;
  String? _errorMessage;
  List<NamedIdPair> _schemas = [];

  DatasetDto? get dataset => _dataset;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<NamedIdPair> get schemas => _schemas;

  void setDataset(DatasetDto dataset) {
    _dataset = dataset;
    _errorMessage = null;
    notifyListeners();
  }

  void setSchemas(List<NamedIdPair> schemas) {
    _schemas = schemas;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String? error) {
    _errorMessage = error;
    notifyListeners();
  }

  void updateName(String name) {
    if (_dataset != null) {
      _dataset!.name = name;
      notifyListeners();
    }
  }

  void updateDesc(String desc) {
    if (_dataset != null) {
      _dataset!.desc = desc;
      notifyListeners();
    }
  }

  void updateContactPoint(String contactPoint) {
    if (_dataset != null) {
      _dataset!.contactPoint = contactPoint;
      notifyListeners();
    }
  }

  void updateKeywords(List<String> keywords) {
    if (_dataset != null) {
      _dataset!.keywords = keywords;
      notifyListeners();
    }
  }

  void updateDistributions(List<DistributionDto> distributions) {
    if (_dataset != null) {
      _dataset!.distributions = distributions;
      notifyListeners();
    }
  }

  void updateSchemaId(int schemaId) {
    if (_dataset != null) {
      _dataset!.schemaId = schemaId;
      notifyListeners();
    }
  }

  void createEmptyDataset() {
    _dataset = DatasetDto(
      id: 0,
      name: '',
      desc: '',
      contactPoint: '',
      keywords: [],
      distributions: [],
      schemaId: 0,
    );
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  void clear() {
    _dataset = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }
}

