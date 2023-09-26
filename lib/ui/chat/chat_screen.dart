import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nilay/model/chat/message.dart';
import 'package:nilay/utils/app_color.dart';
import 'package:nilay/utils/app_helper.dart';
import 'package:nilay/utils/app_text.dart';
import 'package:nilay/utils/components.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';
import 'package:nilay/widget/chat/message_item.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _listMessages = [];
  final _messageController = TextEditingController();
  bool _isShowEmoji = false, _isUploading = false, _isTyping = false;

  @override
  void initState() {
    String uuid = PreferencesManager.getAppData(key: Const.KEY_UUID);
    _listMessages = [
      Message(
          message: 'Hi',
          type: MessageType.TEXT,
          toId: uuid,
          fromId: AppHelper.getCurrentUser()!.uuid,
          sent: '1695668616169',
          read: '',
          toImage: ''),
      Message(
          message: 'Hello',
          type: MessageType.TEXT,
          toId: uuid,
          fromId: AppHelper.getCurrentUser()!.uuid,
          sent: '1695669486824',
          read: '',
          toImage: ''),
      Message(
          message: 'Welcome',
          type: MessageType.TEXT,
          toId: AppHelper.getCurrentUser()!.uuid,
          fromId: uuid,
          sent: '1695669549168',
          read: '',
          toImage: ''),
      Message(
          message: 'How are you',
          type: MessageType.TEXT,
          toId: uuid,
          fromId: AppHelper.getCurrentUser()!.uuid,
          sent: '1695669634543',
          read: '',
          toImage: ''),
      Message(
          message: 'Im fine and you',
          type: MessageType.TEXT,
          toId: uuid,
          fromId: AppHelper.getCurrentUser()!.uuid,
          sent: '1695669920000',
          read: '',
          toImage: ''),
      Message(
          message: 'I need help you',
          type: MessageType.TEXT,
          toId: AppHelper.getCurrentUser()!.uuid,
          fromId: uuid,
          sent: '1695670220000',
          read: '',
          toImage: ''),
      Message(
          message: 'Ok how can help you',
          type: MessageType.TEXT,
          toId: uuid,
          fromId: AppHelper.getCurrentUser()!.uuid,
          sent: '1695670520000',
          read: '',
          toImage: ''),
      Message(
          message: 'Ok how can help you',
          type: MessageType.TEXT,
          toId: AppHelper.getCurrentUser()!.uuid,
          fromId: uuid,
          sent: '1695670700000',
          read: '',
          toImage: ''),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () {
            if (_isShowEmoji) {
              setState(() {
                _isShowEmoji = !_isShowEmoji;
              });
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
          child: SafeArea(
              child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              elevation: 2,
              flexibleSpace: _appBar(),
            ),
            body: Column(children: [
              Expanded(
                  child: _listMessages.isNotEmpty
                      ? ListView.builder(
                          reverse: true,
                          // padding: EdgeInsets.only(top: mq.height * .01),
                          physics: const BouncingScrollPhysics(),
                          itemCount: _listMessages.length,
                          itemBuilder: (_, index) =>
                              MessageItem(message: _listMessages[index]))
                      : Center(child: AppText.medium(text: 'Say Hii! 👋'))),
              if (_isUploading)
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        child: AppWidgets.CustomAnimationProgress())),
              _chatInput(),
              if (_isShowEmoji)
                SizedBox(
                  height: 280.h,
                  child: EmojiPicker(
                    textEditingController: _messageController,
                    config: Config(
                        columns: 7,
                        emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0)),
                  ),
                ),
            ]),
          )),
        ));
  }

  Widget _appBar() => Row(
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: AppColors.colorAppMain)),
          Container(
            width: 50.w,
            height: 50.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: CircleCachedImage(
                  imageUrl: AppHelper.getCurrentUser()!.photo!,
                  isLoading: false),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 10.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.medium(text: AppHelper.getCurrentUser()!.name!),
                AppText.medium(
                    text: 'Last seen not available',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ],
            ),
          )
        ],
      );

  Widget _chatInput1() => Card(
        margin: EdgeInsetsDirectional.only(
            start: 10.r, end: 10.r, top: 20.r, bottom: 20.r),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  setState(() => _isShowEmoji = !_isShowEmoji);
                },
                icon: const Icon(Icons.emoji_emotions,
                    color: AppColors.colorAppMain)),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                    hintText: 'Type a Message',
                    hintStyle: TextStyle(
                      color: AppColors.colorTextSub2,
                    ),
                    border: InputBorder.none),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onTap: () {
                  if (_isShowEmoji) {
                    setState(() => _isShowEmoji = !_isShowEmoji);
                  }
                },
                onChanged: (world) {
                  setState(() {
                    if(_messageController.text.isNotEmpty){
                      _isTyping = true;
                    }else {
                      _isTyping = false;
                    }
                  });
                },
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('${Const.icons}icon_attachment.svg')),
            Container(
              margin: EdgeInsetsDirectional.only(end: 0.r),
              child: FloatingActionButton.small(
                  onPressed: () {},
                  backgroundColor: AppColors.colorAppMain,
                  child: _isTyping ? SvgPicture.asset('${Const.icons}icon_send.svg') : SvgPicture.asset('${Const.icons}icon_mic_.svg', color: Colors.white)),
            )
          ],
        ),
      );

  Widget _chatInput() => Row(
    children: [
      Expanded(
        child: Card(
          margin: EdgeInsetsDirectional.only(
              start: 10.r, end: 2.r, top: 20.r, bottom: 20.r),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() => _isShowEmoji = !_isShowEmoji);
                  },
                  icon: const Icon(Icons.emoji_emotions,
                      color: AppColors.colorAppMain)),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                      hintText: 'Type a Message',
                      hintStyle: TextStyle(
                        color: AppColors.colorTextSub2,
                      ),
                      border: InputBorder.none),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onTap: () {
                    if (_isShowEmoji) {
                      setState(() => _isShowEmoji = !_isShowEmoji);
                    }
                  },
                  onChanged: (world) {
                    setState(() {
                      if(_messageController.text.isNotEmpty){
                        _isTyping = true;
                      }else {
                        _isTyping = false;
                      }
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 5.r, end: 8.r),
                child: GestureDetector(
                    onTap: () {
                      AppHelper.showToast(message: 'Attachment');
                    },
                    child: SvgPicture.asset('${Const.icons}icon_attachment.svg')),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 5.r, end: 8.r),
                child: GestureDetector(
                    onTap: () {
                      AppHelper.showToast(message: 'Record Voice');
                    },
                    child: SvgPicture.asset('${Const.icons}icon_mic.svg')),
              ),

            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsetsDirectional.only(end: 8.r),
        child: FloatingActionButton.small(
            onPressed: () {
              if(_isTyping){
                AppHelper.showToast(message: 'Send Message');
              }else {
                AppHelper.showToast(message: 'Send Voice Message');
              }
            },
            backgroundColor: AppColors.colorAppMain,
            child: _isTyping ? SvgPicture.asset('${Const.icons}icon_send.svg') : SvgPicture.asset('${Const.icons}icon_mic_.svg', color: Colors.white)),
      )
    ],
  );
}
