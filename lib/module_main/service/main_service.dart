import 'package:store_web/abstracts/data_model/data_model.dart';
import 'package:store_web/generated/l10n.dart';
import 'package:store_web/module_main/manager/main_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:store_web/module_main/model/profile_model/profile_model.dart';
import 'package:store_web/module_main/response/profile_response/profile_response.dart';
import 'package:store_web/utils/helpers/status_code_helper.dart';
import 'package:store_web/utils/response/action_response.dart';

@injectable
class MainService {
  final MainManager _manager;

  MainService(
    this._manager,
  );

  Future<String?> getAdminToken() async {
    var res = await _manager.getAdminToken();

    return res?.token;
  }

  Future<DataModel> deleteStore(
    int storeID,
    String adminToken,
  ) async {
    ActionResponse? actionResponse =
        await _manager.deleteStore(storeID, adminToken);

    if (actionResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (actionResponse.statusCode != '401') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(actionResponse.statusCode));
    }
    return DataModel.empty();
  }

  Future<DataModel> getProfile() async {
    ProfileResponse? response = await _manager.getOwnerProfile();
    if (response == null) return DataModel.withError(S.current.networkError);
    if (response.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(response.statusCode));
    }
    if (response.data == null) {
      return DataModel.empty();
    }

    ProfileModel profile = ProfileModel.withData(response);

    return profile;
  }
}
