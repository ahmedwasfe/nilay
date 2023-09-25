import 'package:get/get.dart';
import 'package:nilay/model/album_select.dart';
import 'package:nilay/utils/constants.dart';

class AlbumBeautyCenterController extends GetxController {

  List<AlbumSelect> listAlbumType = [
    AlbumSelect(name: 'photos', type: Const.KEY_PHOTOS, isSelcted: true),
    AlbumSelect(name: 'videos', type: Const.KEY_VIDEOS, isSelcted: true)
  ];

  List<String> imageList = [
    Const.storesHomeSlider1,
    Const.storesHomeSlider2,
    Const.storesHomeSlider3,
    Const.storesHomeSlider4,
    Const.storesHomeSlider5,
    Const.storesHomeSlider6,
    Const.beautyHomeSlider1,
    Const.beautyHomeSlider2,
    Const.beautyHomeSlider3,
    Const.beautyHomeSlider4,
    Const.beautyHomeSlider5,
  ];
}