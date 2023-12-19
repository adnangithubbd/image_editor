import 'package:flutter/material.dart';
import 'package:image_editor/widgets/default_button.dart';

import '../models/text_info.dart';
import '../screens/edit_image_screen.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  final TextEditingController _editingController = TextEditingController();
  final TextEditingController creatorText = TextEditingController();
  List<TextInfo> texts = [];

  int currentIndex = 0;

  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${texts[index].text} \n is selected for editing..')));
  }
  changeTextColor(Color color){
    setState(() {
      texts[currentIndex].color=color;
    });
  }

  addNewText(BuildContext context) {
    setState(() {
      texts.add(TextInfo(
          text: _editingController.text,
          left: 0,
          top: 0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          textAlign: TextAlign.left));
      Navigator.pop(context);
    });
  }

  addNewDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Text'),
        content: TextField(
          controller: _editingController,
          maxLines: 5,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: const Icon(Icons.edit),
              hintText: 'Your text is here..'),
        ),
        actions: [
          DefaultButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black,
              textColor: Colors.white,
              child: const Text('Back')),
          DefaultButton(
              onPressed: () {
                addNewText(context);
              },
              color: Colors.black,
              textColor: Colors.white,
              child: const Text('Add Text')),
        ],
      ),
    );
  }
}
