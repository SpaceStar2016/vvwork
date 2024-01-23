import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:vvword/page/vv_markdown.dart';
import 'package:vvword/page/vv_screen_loading.dart';
import '../Utils/UIUtils.dart';

// 需要做缓存
class TextRecognitionPage extends StatefulWidget {
  @override
  _TextRecognitionPageState createState() => _TextRecognitionPageState();
}

class _TextRecognitionPageState extends State<TextRecognitionPage> {
  LoadingStatus _loadingStatus = LoadingStatus.done;

  String res = "";
  @override
  Widget build(BuildContext context) {
    final username = "username";
    return Scaffold(
      appBar: VvWordAppBar(
        title: const Text("单词输入"),
        leading: CustomBackButton(
          icon: Png.name('mine_icon_back', width: 24),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: VvLoadingScreen(
        onRetry: () {},
        status: _loadingStatus,
        builder: (context) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: SelectionArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        res,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    foregroundColor: Colors.white,
                    backgroundColor: UIUtils.themeBlue,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    selectImages();
                  },
                  child: const Text(
                    "选择图片",
                    style: TextStyle(color: UIUtils.themeCharacterWhite),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  Future<void> selectImages() async {
    List<Media> listImagePaths = await ImagePickers.pickerPaths(
        language: Language.chinese,
        galleryMode: GalleryMode.image,
        selectCount: 1,
        showGif: false,
        showCamera: true,
        compressSize: 500,
        uiConfig: UIConfig(uiThemeColor: UIUtils.themeBlue),
        cropConfig: CropConfig(enableCrop: false, width: 2, height: 1));

    _loadingStatus = LoadingStatus.loading;
    setState(() {});
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final filePath = listImagePaths.first.path;
    if (filePath == null) {
      return;
    }
    final inputImage = InputImage.fromFilePath(filePath);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    res = text;
    // String letterText =  keepOnlyLetters(text);
    // print(letterText);
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;
      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        print("-------");
        print("${line.text}");
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
        }
      }
    }
    textRecognizer.close();
    _loadingStatus = LoadingStatus.done;
    setState(() {});
  }

  String keepOnlyLetters(String input) {
    // 使用正则表达式匹配所有英文单词字符
    RegExp regExp = RegExp(r'[a-zA-Z]+');
    Iterable<Match> matches = regExp.allMatches(input);

    // 将匹配到的字符连接起来
    String result = matches.map((match) => match.group(0)!).join();

    return result;
  }
}
