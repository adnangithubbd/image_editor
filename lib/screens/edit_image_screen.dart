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
        appBar: _appBar,
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
                    //todo onTap
                    onTap:()=>setCurrentIndex(context, i),
                    child: Draggable(
                      feedback: ImageText(textInfo: texts[i]),
                      child: ImageText(textInfo: texts[i]),
                      onDragEnd: (DraggableDetails details) {
                        final Offset draggedPosition = details.offset;
                        final double topValue = draggedPosition.dy;
                        final double leftValue = draggedPosition.dx;
                        print('top $topValue and left $leftValue');
                        setState(() {
                          texts[i].top = topValue;
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

  AppBar get _appBar => AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: Colors.black,
                ),
                tooltip: 'Save',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                tooltip: 'Increase font',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                tooltip: 'Decrease font',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.align_horizontal_left,
                  color: Colors.black,
                ),
                tooltip: 'Align left',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.align_horizontal_center,
                  color: Colors.black,
                ),
                tooltip: 'Align Center',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.align_horizontal_right,
                  color: Colors.black,
                ),
                tooltip: 'Align right',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_bold,
                  color: Colors.black,
                ),
                tooltip: 'Bold',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_italic,
                  color: Colors.black,
                ),
                tooltip: 'Italic',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.space_bar,
                  color: Colors.black,
                ),
                tooltip: 'Add new Line',
              ),
              //todo color plates
              SizedBox(width: 5),
              Tooltip(
                message: 'Blue',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.blue),
                  child: CircleAvatar(backgroundColor: Colors.blue),
                ),
              ),
              SizedBox(width: 5),
              Tooltip(
                message: 'White',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.white),
                  child: CircleAvatar(backgroundColor: Colors.white),
                ),
              ),
              SizedBox(width: 5),
              Tooltip(
                message: 'Red',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.red),
                  child: CircleAvatar(backgroundColor: Colors.red),
                ),
              ),
              SizedBox(width: 5),
              Tooltip(
                message: 'Green',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.green),
                  child: CircleAvatar(backgroundColor: Colors.green),
                ),
              ),
              SizedBox(width: 5),
              Tooltip(
                message: 'Black',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.black),
                  child: CircleAvatar(backgroundColor: Colors.black),
                ),
              ),
              SizedBox(width: 5),
              Tooltip(
                message: 'Yellow',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.yellow),
                  child: CircleAvatar(backgroundColor: Colors.yellow),
                ),
              ),
              SizedBox(width: 5),
              Tooltip(
                message: 'Pink',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.pink),
                  child: CircleAvatar(backgroundColor: Colors.pink),
                ),
              ),

            ],
          ),
        ),
      );
}
