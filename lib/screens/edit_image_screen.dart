import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_editor/widgets/image_text.dart';

import '../models/text_info.dart';
import '../widgets/edit_image_viewmodel.dart';

class EditImageScreen extends StatefulWidget {
  final String selectedImage;

  EditImageScreen({super.key, required this.selectedImage});

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  List<TextInfo> texts = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Stack(
          children: [
            _selectedImage,
            for (int i = 0; i < texts.length; i++)
              Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    onLongPress: () {
                      print('Long pressed');
                    },
                    onTap: () {
                      print('Just Tapped');
                    },
                    child: Draggable(
                      feedback: ImageText(textInfo: texts[i]),
                      child: ImageText(textInfo: texts[i]),
                      onDragEnd: (DraggableDetails details) {
                        final Offset draggedPosition = details.offset;
                        final double topValue = draggedPosition.dy;
                        final double leftValue = draggedPosition.dx;
                        print('top $topValue and left $leftValue');
                        setState(() {
                          texts[i].top = topValue - 96;
                          texts[i].left = leftValue;
                        });
                      },
                    ),
                  )),
            creatorText.text.isNotEmpty
                ? Positioned(
                    left: 0,
                    bottom: 0,
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.3)),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
        floatingActionButton: _addnewTextFab(),
      ),
    );
  }

  Widget get _selectedImage => Image.file(
        File(widget.selectedImage),
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: 300,
      );

  Widget _addnewTextFab() {
    return FloatingActionButton(
      onPressed: () {
        addNewDialog(context);
      },
      tooltip: 'Add new Text',
      child: const Icon(Icons.edit),
    );
  }
}
