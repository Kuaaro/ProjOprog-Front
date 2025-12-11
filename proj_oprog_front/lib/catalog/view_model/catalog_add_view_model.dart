import 'package:flutter/foundation.dart';
// Pamiętaj o zaimportowaniu swojego DTO
import 'package:proj_oprog_front/catalog/dto/catalog_dto.dart'; 

class CatalogAddViewModel extends ChangeNotifier {
  CatalogDto? _catalog;
  bool _isLoading = false;
  String? _errorMessage;

  // Gettery
  CatalogDto? get catalog => _catalog;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Settery stanu
  void setCatalog(CatalogDto catalog) {
    _catalog = catalog;
    _errorMessage = null;
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

  // Metody aktualizujące pola formularza
  void updateName(String name) {
    if (_catalog != null) {
      _catalog!.name = name;
      notifyListeners();
    }
  }

  void updateDescription(String description) {
    if (_catalog != null) {
      _catalog!.description = description;
      notifyListeners();
    }
  }

  // Inicjalizacja pustego katalogu (dla trybu dodawania)
  void createEmptyCatalog() {
    _catalog = CatalogDto(
      id: 0, // 0 oznacza nowy obiekt, który nie ma jeszcze ID z bazy
      name: '',
      description: '',
      parentCatalogId: 0,
    );
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }

  // Czyszczenie stanu przy wyjściu z ekranu
  void clear() {
    _catalog = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }
}