import 'package:get/get.dart';
import 'package:nilay/model/album_select.dart';
import 'package:nilay/utils/constants.dart';

class AlbumBeautyCenterController extends GetxController {

  String imageSelected = '';
  String videoSelected = '';
  String typeSelected = Const.KEY_PHOTOS;

  List<AlbumSelect> listAlbumType = [
    AlbumSelect(name: 'photos', type: Const.KEY_PHOTOS, isSelcted: true),
    AlbumSelect(name: 'videos', type: Const.KEY_VIDEOS, isSelcted: false)
  ];

  List<String> listImages = [
    Const.imageOrdersDress6,
    Const.storesHomeSlider1,
    Const.storeOrder2,
    Const.topFiveCenters6,
    Const.imageOrdersDress7,
    Const.storeOrder22,
    Const.imageOrdersDress2,
    Const.storesHomeSlider4,
    Const.topFiveCenters17,
    Const.imageOrdersDress3,
    Const.storesHomeSlider6,
    Const.topFiveCenters1,
    Const.storeOrder13,
    Const.imageOrdersDress5,
    Const.imageOrdersDress10,
    Const.beautyHomeSlider3,
    Const.beautyHomeSlider4,
    Const.storeSlider6,
    Const.imageOrdersDress1,

  ];

  List<String> listVideos = [
    Const.topFiveCenters6,
    Const.storeOrder2,
    Const.storesHomeSlider4,
    Const.imageOrdersDress6,
    Const.storesHomeSlider1,
    Const.imageOrdersDress2,
    Const.storeOrder22,
    Const.topFiveCenters17,
    Const.imageOrdersDress7,
    Const.imageOrdersDress10,
    Const.storesHomeSlider6,
    Const.topFiveCenters1,
    Const.imageOrdersDress1,
    Const.imageOrdersDress3,
    Const.imageOrdersDress5,
    Const.beautyHomeSlider3,
    Const.beautyHomeSlider4,
    Const.storeSlider6,
    Const.storeOrder13,
  ];

  @override
  void onInit() {
    imageSelected = listImages[0];
    videoSelected = listVideos[2];
    super.onInit();
  }


}