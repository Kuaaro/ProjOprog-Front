import 'package:proj_oprog_front/schema/use_case/iadd_schema_uc.dart';
import 'package:proj_oprog_front/schema/use_case/iedit_schema_uc.dart';
import 'package:proj_oprog_front/schema/view_model/show_schema_list_view_model.dart';

class ShowSchemaListController {
  ShowSchemaListViewModel viewModel;
  IAddSchemaUC addSchemaUC;
  IEditSchemaUC editSchemaUC;

  ShowSchemaListController({
    required this.viewModel,
    required this.addSchemaUC,
    required this.editSchemaUC,
  });

  void showAddSchema() {
    addSchemaUC.showAddSchemaView();
  }

  void showEditSchema(int id) {
    editSchemaUC.showEditSchemaView(id);
  }

}
