import 'dart:developer';

import 'package:get/get.dart';
import 'package:nilay/model/album_select.dart';
import 'package:nilay/utils/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AlbumBeautyCenterController extends GetxController {

  String? thumbnailUrl;

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
    Const.videoUrl,
    // Const.video,
    Const.videoUrlLandscape,
    Const.videoUrlPortrait,
    Const.longVideo,
    Const.video480,
    Const.video240,
    Const.video1,
  ];

  @override
  void onInit() {
    imageSelected = listImages[0];
    videoSelected = listVideos[0];
    // getVideoThumbnail('');
    super.onInit();
  }

  Future<String> getVideoThumbnail(String videoUrl) async {
    // log('getVideoThumbnail FUN');
    String? name = await VideoThumbnail.thumbnailFile(video: videoUrl, thumbnailPath: (await getTemporaryDirectory()).path, imageFormat: ImageFormat.PNG);
    // log('getVideoThumbnail fileName:');
    // log('getVideoThumbnail fileName: $thumbnailUrl');
    return name!;
  }

  getThumbnail(String url) async {
    final th = await VideoThumbnail.thumbnailData(video: url);
    return th;
  }

}