import 'package:flutter/material.dart';

enum LoadingStatus {
  loading,
  error,
  done,
}

class VvLoadingScreen extends StatelessWidget {
  final LoadingStatus status;
  final VoidCallback? onRetry;
  final Widget Function(BuildContext context) builder;

  const VvLoadingScreen({
    super.key,
    required this.status,
    required this.builder,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadingStatus.loading:
        return Center(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24 / 3)),
              color: const Color.fromRGBO(137, 140, 142, 1.0),
            ),
            child: const Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            ),
          ),
          // child: CircularProgressIndicator(),
        );
      case LoadingStatus.error:
        return _getNetworkLoadErrorWidget(context);
      case LoadingStatus.done:
        return builder(context);
    }
  }

  Widget _getNetworkLoadErrorWidget(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 48 / 3),
            Text(
              '[  操作失败  ]',
              style:
                  TextStyle(fontSize: 46 / 3, color: const Color(0xFF666666)),
            ),
            SizedBox(height: 106 / 3),
            TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(420 / 3, 120 / 3),
                  backgroundColor: const Color(0xFF5D5FEF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(166 / 3)),
                ),
                onPressed: () => onRetry?.call(),
                child: Text("重试",
                    style: TextStyle(
                        fontSize: 42 / 3,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))),
          ],
        ),
      ),
    );
  }
}
