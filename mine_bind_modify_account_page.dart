import 'dart:io';
import 'package:app/common/extension/size_extension.dart';
import 'package:app/model/localizations.dart';
import 'package:app/page/mine/verification_code_page.dart';
import 'package:app/page/sai_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/util/utils.dart';
import 'package:app/component/sai_loading.dart';
import 'package:app/model/user.dart';
import 'package:app/common/extension/string_extension.dart';
import 'package:app/component/sai_text_button.dart';
import 'package:app/model/auth_method.dart';
import 'package:app/page/login/login_account_service_agreement.dart';

import '../../common/widget/custom_back_button.dart';
import '../../component/sai_action.dart';
import '../../generated/l10n.dart';
import '../login/widget/resend_cool_down_widget.dart';

class BindOrModifyAccountPage extends StatefulWidget {
  final AuthMethod authMethod;

  BindOrModifyAccountPage({
    super.key,
    AuthMethod? authMethod,
  }) : authMethod = authMethod ?? AuthMethod(type: AuthMethod.defaultType());

  @override
  State<BindOrModifyAccountPage> createState() =>
      _BindOrModifyAccountPageState();
}

class _BindOrModifyAccountPageState extends State<BindOrModifyAccountPage> {
  AuthMethodType get _type => widget.authMethod.type;

  final _accountController = TextEditingController();

  final _verificationController = TextEditingController();

  final _coolDownController = ResendCoolDownController();

  bool _isAgreement = false;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(140.w),
        borderSide: BorderSide.none);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: RpgAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leading: CustomBackButton(
            icon: Png.name('mine_icon_back', width: 24),
          ),
        ),
        backgroundColor: const Color(0xFFEDF4F7),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 26, right: 26),
            child: Column(
              children: [
                const SizedBox(height: 18),
                _topTextDesWidget(),
                const SizedBox(height: 110 / 3),
                _inputAccountWidget(),
                const SizedBox(height: 40 / 3),
                _inputVerificationCode(),
                const SizedBox(
                  height: 22,
                ),
                AccountServiceAgreement(
                  isAgreement: _isAgreement,
                  onPressed: () {
                    _isAgreement = !_isAgreement;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 10),
                SaiTextButton(
                  text: S.current.app_confirm,
                  backgroundColor: _canConfirm()
                      ? const Color(0xFF7266FF)
                      : const Color(0xFFC4CACD),
                  textColor: Colors.white,
                  fontSize: 44.sf,
                  fontWeight: FontWeight.w600,
                  size: const Size.fromHeight(44),
                  onPressed: () => _canConfirm() ? _confirmHandle() : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _topTextDesWidget() {
    String title = '';
    String subTitle = '';
    if (User.current()?.isBindEmail ?? false) {
      title = S.current.mine_page_modify_email_title;
      subTitle =
          S.current.mine_page_modify_email_des(User.current()?.email ?? '');
    } else {
      title = S.current.mine_page_bind_email_title;
      subTitle = S.current.mine_page_bind_modify_account_tips_base_des(S.current.app_name);
    }
    TextStyle titleStyle =
        TextStyle(color: const Color(0xFF383C47), fontSize: 80.sf);
    TextStyle subTitleStyle =
        TextStyle(color: const Color(0xFF383C47), fontSize: 40.sf);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        SizedBox(height: 24.h, width: double.infinity),
        Text(subTitle, style: subTitleStyle)
      ],
    );
  }

  Widget _inputAccountWidget() {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(140.0),
        borderSide: BorderSide.none);
    List<TextInputFormatter>? inputFormatters;
    String hintText = S.current.mine_account_hint_email_input;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.from([
        _type == AuthMethodType.mobile
            ? Text(
                '+86',
                style: TextStyle(
                    fontSize: 44.sf,
                    color: const Color(0xFFD4D4D4),
                    fontWeight: FontWeight.w600),
              )
            : null,
        _type == AuthMethodType.mobile ? SizedBox(width: 30.w) : null,
        Expanded(
          child: Container(
            constraints: BoxConstraints(minHeight: 132.h),
            child: Center(
              child: TextField(
                onChanged: (text) {
                  setState(() {});
                },
                controller: _accountController,
                keyboardType: TextInputType.emailAddress,
                keyboardAppearance: Brightness.dark,
                cursorColor: const Color(0xFF7266FF),
                cursorRadius: const Radius.circular(3),
                cursorWidth: 2,
                cursorHeight: 24,
                inputFormatters: inputFormatters,
                decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 44.sf,
                      color: const Color(0xFF999999),
                      height: 24 / 44.sf - 0.1),
                  border: border,
                  disabledBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  fillColor: const Color(0xFFFFFFFF),
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 20, top: 14, bottom: 14),
                  filled: true,
                  suffixIcon: Offstage(
                    offstage: _accountController.text.isEmpty,
                    child: IconButton(
                        constraints: const BoxConstraints(
                          minWidth: 36,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _accountController.text = '';
                          setState(() {});
                        },
                        icon: SizedBox(
                          width: 16,
                          height: 16,
                          child: Png.name('mine_input_clean'),
                        )),
                  ),
                ),
                style: TextStyle(
                    fontSize: 44.sf,
                    color: const Color(0xFF383C47),
                    height: 24 / 44.sf - 0.1),
              ),
            ),
          ),
        ),
      ].where((e) => e != null)),
    );
  }

  Widget _inputVerificationCode() {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(140.0),
        borderSide: BorderSide.none);
    String hintText = S.current.mine_account_email_verification_tip;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.from([
        _type == AuthMethodType.mobile
            ? Text(
                '+86',
                style: TextStyle(
                    fontSize: 44.sf,
                    color: const Color(0xFFD4D4D4),
                    fontWeight: FontWeight.w600),
              )
            : null,
        _type == AuthMethodType.mobile ? SizedBox(width: 30.w) : null,
        Expanded(
          child: Container(
            constraints: BoxConstraints(minHeight: 132.h),
            child: Center(
              child: TextField(
                onChanged: (text) {
                  setState(() {});
                },
                controller: _verificationController,
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
                cursorColor: const Color(0xFF7266FF),
                cursorRadius: const Radius.circular(3),
                cursorWidth: 2,
                cursorHeight: 24,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                ],
                decoration: InputDecoration(
                  isCollapsed: true,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 44.sf,
                      color: const Color(0xFF999999),
                      height: 24 / 44.sf - 0.1),
                  border: border,
                  disabledBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  fillColor: const Color(0xFFFFFFFF),
                  contentPadding: const EdgeInsets.only(
                      left: 20, right: 20, top: 14, bottom: 14),
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 14, right: 60 / 3),
                    child: ResendCoolDownWidget(
                        controller: _coolDownController,
                        resendRouseEventCallBack: () {
                          if (_coolDownController.isCooling) {
                            return;
                          }
                          if (_type == AuthMethodType.email &&
                              !Utils.isValidEmail(
                                  _accountController.text.trim())) {
                            SaiLoading.showToast(S.current.mine_agreement_correct_email_input);
                            return;
                          }
                          // 判断邮箱重复
                          var currentEmail = User.current()?.email;
                          final account = _accountController.text.trim();
                          if (currentEmail != null && currentEmail == account) {
                            SaiLoading.showToast(S.current
                                .mine_email_verification_same_email_input);
                            return;
                          }
                          _sendVerifyCode();
                        }),
                  ),
                ),
                style: TextStyle(
                    fontSize: 44.sf,
                    color: const Color(0xFF383C47),
                    height: 24 / 44.sf - 0.1),
              ),
            ),
          ),
        ),
      ].where((e) => e != null)),
    );
  }

  // 点击确认
  _confirmHandle() {
    // 判断是否同意用户隐私协议
    if (!_isAgreement) {
      AccountServiceAgreement.popupAgreementDialog(context, () {
        _isAgreement = true;
        setState(() {});
        _confirmHandle();
      });
      return;
    }
    final account = _accountController.text.trim();
    final verificationCode = _verificationController.text.trim();
    // 判断邮箱是否符合规定
    if (!Utils.isValidEmail(account)) {
      SaiLoading.showToast(S.current.mine_agreement_correct_email_input);
      return;
    }
    SaiAction.bindAccountSafety(
            account: account,
            vcode: verificationCode,
            actionType: ActionType.email)
        .then((value) {
      if (value) {
        Navigator.pop(context);
      }
    });
  }

  bool _canConfirm() {
    return _accountController.text.isNotEmpty &&
        _verificationController.text.length == 4;
  }

  _sendVerifyCode() {
    _coolDownController.coolDown(const Duration(minutes: 1));
    widget.authMethod.sendVerifyCode(_accountController.text.trim());
  }
}
