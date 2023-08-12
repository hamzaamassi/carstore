import 'package:cloudinary_sdk/cloudinary_sdk.dart';

class CloudinaryService {
  static CloudinaryService? _instance;
  Cloudinary? _cloudinary;

  static CloudinaryService get instance => _instance ??= CloudinaryService();

  Cloudinary? get cloudinary => _cloudinary;

  void init() {
    _cloudinary = Cloudinary.full(
      apiKey: '238796677486438',
      apiSecret: '05ZX6iB4-uinBCyhavvBtT9LGO4',
      cloudName: 'da3pggd80',
    );
  }
}
