import 'package:injectable/injectable.dart';
import 'package:store_web/module_upload/repository/upload_repository/upload_repository.dart';
import 'package:store_web/module_upload/response/imgbb/imgbb_response.dart';

@injectable
class UploadManager {
  final UploadRepository _repository;
  UploadManager(this._repository);

  Future<ImgBBResponse?> upload(String filePath) {
    return _repository.upload(filePath);
  }

  Future<ImgBBResponse?> uploadPDF(String filePath) {
    return _repository.uploadPDF(filePath);
  }
}
