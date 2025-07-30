import 'package:get/get.dart';

import '../../modules/multi_color/controller.dart';


class MultiColorBinding implements Bindings {
    @override
    void dependencies() {
       
        Get.lazyPut<MultiColorController>(() => MultiColorController());
    }
}