import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvword/Model/vocabulary.dart';
import 'package:vvword/Utils/UIUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vvword/cache/db_utils.dart';

import 'ocr_page.dart';

class AddPage extends StatefulWidget {

  const AddPage({super.key});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();
  final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(140.0), borderSide: BorderSide.none);
  List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: VvWordAppBar(
          title: const Text("单词输入"),
          leading: CustomBackButton(
            icon: Png.name('mine_icon_back', width: 24),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  controller: _wordController,
                  keyboardType: TextInputType.emailAddress,
                  keyboardAppearance: Brightness.dark,
                  cursorColor: const Color(0xFF7266FF),
                  cursorRadius: const Radius.circular(3),
                  cursorWidth: 2,
                  cursorHeight: 24,
                  inputFormatters: inputFormatters,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: "输入英文单词",
                    hintStyle: const TextStyle(
                        fontSize: 44 / 3,
                        color: UIUtils.themeCharacterHint,
                        height: 24 / 44 / 3 - 0.1),
                    border: border,
                    disabledBorder: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    fillColor: const Color(0xFFFFFFFF),
                    contentPadding: const EdgeInsets.only(
                        left: 20, right: 20, top: 14, bottom: 14),
                    filled: true,
                    suffixIcon: Offstage(
                        offstage: _wordController.text.isEmpty,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          onPressed: () {
                            _wordController.text = '';
                            setState(() {});
                          },
                        )),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (text) {
                  },
                  controller: _translationController,
                  keyboardType: TextInputType.emailAddress,
                  keyboardAppearance: Brightness.dark,
                  cursorColor: const Color(0xFF7266FF),
                  cursorRadius: const Radius.circular(3),
                  cursorWidth: 2,
                  cursorHeight: 24,
                  inputFormatters: inputFormatters,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    hintText: "输入翻译(非必须)",
                    hintStyle: const TextStyle(
                        fontSize: 44 / 3,
                        color: UIUtils.themeCharacterHint,
                        height: 24 / 44 / 3 - 0.1),
                    border: border,
                    disabledBorder: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    fillColor: const Color(0xFFFFFFFF),
                    contentPadding: const EdgeInsets.only(
                        left: 20, right: 20, top: 14, bottom: 14),
                    filled: true,
                    suffixIcon: Offstage(
                        offstage: _translationController.text.isEmpty,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          onPressed: () {
                            _translationController.text = '';
                            setState(() {});
                          },
                        )),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                // const Text(
                //   "标签:",
                //   style: TextStyle(
                //       color: UIUtils.themeCharacterBlack,
                //       fontSize: 18,
                //       fontWeight: FontWeight.w600),
                // ),
                // const TagSelector(),
                Row(
                  children: [
                    _makeButton("扫描取词", AddType.addOcr),
                    const SizedBox(width: 10,),
                    _makeButton("图片取词",AddType.addTextRecognition),
                    const SizedBox(width: 10,),
                    _makeButton("语音输入",AddType.other),
                  ],
                ),
                const Spacer(),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    foregroundColor: Colors.white,
                    backgroundColor: _canConfirm() ? UIUtils.themeBlue : UIUtils.themeGrey,
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  onPressed: (){
                    _canConfirm() ? _confirmHandle() : null;
                  },
                  child: const Text(
                    "保存",
                    style: TextStyle(color: UIUtils.themeCharacterWhite),
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _makeButton(String text, AddType type){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        padding: EdgeInsets.zero,
        minimumSize: const Size(100, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)),
        foregroundColor: Colors.white,
        backgroundColor:  UIUtils.themeBlue,
        textStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onPressed: (){
        if (type == AddType.addOcr) {
          _showOcr();
        }
        if (type == AddType.addTextRecognition) {
          _showTextRecognition();
        }
      },
      child: Text(
        text,
        style: const TextStyle(color: UIUtils.themeCharacterWhite),
      ),
    );
  }

  _showOcr() {
    final page = OcrPage();
    page.cb = (text){
      _wordController.text = text;
    };
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  _showTextRecognition() {
    Navigator.pushNamed(context, '/TextRecognitionPage');
  }


  _confirmHandle() async {
    final vv = Vocabulary(
        word: _wordController.text, translation: _translationController.text);
    DBUtils.addVocabulary(vv);
    Fluttertoast.showToast(msg: "添加成功");
    _wordController.text = "";
    _translationController.text = "";
    setState(() {});
  }

  bool _canConfirm() {
    return _wordController.text.isNotEmpty;
  }
}

enum AddType {
  addOcr,
  addTextRecognition,
  other,
}