import 'package:fade_auto_complet/data/model/complete_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FadeAutoCompleteFuture extends StatefulWidget {
  FadeAutoCompleteFuture({
    Key? key,
    required this.getKeys,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.style,
    this.autofocus = false,
    this.textStyle,
    this.keyboardType,
    this.onSubmitted,
    this.onChanged,
    this.autocorrect = true,
    this.focusNode,
    this.autofillHints,
    this.autovalidateMode,
    this.cursorColor,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    this.enableInteractiveSelection = true,
    this.enableSuggestions = true,
    this.enabled,
    this.initialValue,
    this.colorBackgroundText,
    this.validator,
    this.onTap,
  }) : super(key: key);
  final Future<List<CompleteModel>?> Function() getKeys;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final TextStyle? style;
  final bool autofocus;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final void Function(CompleteModel? _completeModel)? onSubmitted;
  final void Function(CompleteModel? _completeModel)? onChanged;
  final bool autocorrect;
  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final Color? cursorColor;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final bool enableInteractiveSelection;
  final bool enableSuggestions;
  final bool? enabled;
  final String? initialValue;
  final Color? colorBackgroundText;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  _FadeAutoCompleteFutureState createState() => _FadeAutoCompleteFutureState();
}

class _FadeAutoCompleteFutureState extends State<FadeAutoCompleteFuture> with TickerProviderStateMixin {
  final _fadeController = TextEditingController();
  late AnimationController _resizableController;
  late bool defaultBorder = true;
  bool asFutureLoading = false;
  late Future<List<CompleteModel>?> futureKeys;
  TextEditingController controller = TextEditingController();
  CompleteModel? _element;

  @override
  void initState() {
    super.initState();
    _resizableController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 1000,
      ),
    );

    futureKeys = widget.getKeys();
    _resizableController.addStatusListener((animationStatus) {
      switch (animationStatus) {
        case AnimationStatus.completed:
          _resizableController.reverse();
          break;
        case AnimationStatus.dismissed:
          _resizableController.forward();
          break;
        case AnimationStatus.forward:
          break;
        case AnimationStatus.reverse:
          break;
      }
    });

    // _resizableController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CompleteModel>?>(
        future: futureKeys,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
            case ConnectionState.done:
              return AnimatedBuilder(
                animation: _resizableController,
                builder: (context, child) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 6),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: defaultBorder ? 1 : _resizableController.value * 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        TextFormField(
                          textAlign: widget.textAlign,
                          controller: _fadeController,
                          style: widget.textStyle?.copyWith(
                                color: Colors.grey[400],
                              ) ??
                              TextStyle(
                                color: Colors.grey[400],
                              ),
                          decoration: widget.decoration?.copyWith(
                                hintText: '',
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ) ??
                              InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                          child: TextFormField(
                            key: widget.key,
                            validator: widget.validator,
                            textAlign: widget.textAlign,
                            focusNode: widget.focusNode,
                            autofillHints: widget.autofillHints,
                            autofocus: widget.autofocus,
                            style: widget.textStyle,
                            controller: controller,
                            keyboardType: widget.keyboardType,
                            autovalidateMode: widget.autovalidateMode,
                            cursorColor: widget.cursorColor,
                            cursorHeight: widget.cursorHeight,
                            cursorRadius: widget.cursorRadius,
                            cursorWidth: widget.cursorWidth,
                            decoration: widget.decoration?.copyWith(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ) ??
                                InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                            enableInteractiveSelection: widget.enableInteractiveSelection,
                            enableSuggestions: widget.enableSuggestions,
                            enabled: widget.enabled,
                            initialValue: widget.initialValue,
                            onTap: widget.onTap,
                            onFieldSubmitted: (value) {
                              _autoComplete(value: value);
                              if (widget.onSubmitted != null) {
                                widget.onSubmitted!(_element);
                              }
                            },
                            onChanged: (value) async {
                              setState(() {
                                defaultBorder = false;
                              });
                              _fadeController.clear();
                              _resizableController.reset();
                              _resizableController.forward();
                              List<CompleteModel>? keys = snapshot.data;
                              int indexKey = 0;

                              _resizableController.stop();
                              setState(() {
                                defaultBorder = true;
                                if (keys != null) {
                                  if (controller.text.isEmpty) {
                                    _fadeController.clear();
                                  } else {
                                    indexKey = keys.indexWhere(
                                      (element) => element.value.startsWith(
                                        value,
                                      ),
                                    );
                                    if (indexKey >= 0) {
                                      _element = keys[indexKey];
                                      _fadeController.text = keys[indexKey].value;
                                    } else {
                                      _element = null;
                                      _fadeController.clear();
                                    }
                                  }
                                }
                                if (widget.onChanged != null) {
                                  if (keys?[indexKey] != null) {
                                    widget.onChanged!(_element);
                                  } else {
                                    widget.onChanged!(null);
                                  }
                                }
                              });
                            },
                            autocorrect: widget.autocorrect,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
          }
        });
  }

  _autoComplete({required String value}) {
    if (_fadeController.value.text.isNotEmpty) {
      controller.text = _fadeController.text;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
      _fadeController.clear();
      print(controller.value.text);
    }
  }
}
