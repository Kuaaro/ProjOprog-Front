import 'package:proj_oprog_front/config/router.dart';
import 'package:proj_oprog_front/schema/dto/schema_dto.dart';
import 'package:proj_oprog_front/schema/presenter/iadd_schema_presenter.dart';
import 'package:proj_oprog_front/schema/view_model/add_schema_view_model.dart';

class AddSchemaPresenter implements IAddSchemaPresenter {
  final AddSchemaViewModel viewModel;

  AddSchemaPresenter(this.viewModel);

  @override
  void onSchemaAdded(SchemaDto schema) {
    viewModel.clearFields();
    viewModel.setStatus('Success');
    router.go('/schema');
  }
  @override
  void onError(String error) {
    viewModel.setStatus('Error: $error');
    // zostajemy
  }
  
  @override
  void onShowAddSchemaView() {
    router.go('/add-schema');
  }
}