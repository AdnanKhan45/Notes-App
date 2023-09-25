import 'package:flutter/material.dart';
import 'package:notes_app/database/database_handler.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/theme/colors.dart';
import 'package:notes_app/utils/utility.dart';
import 'package:notes_app/widgets/button_widget.dart';
import 'package:notes_app/widgets/dialog_box_widget.dart';
import 'package:notes_app/widgets/form_widget.dart';

class EditNotePage extends StatefulWidget {
  final NoteModel noteModel;
  const EditNotePage({Key? key, required this.noteModel}) : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  TextEditingController? _titleController;
  TextEditingController? _bodyController;
  int selectedColor = 4294967295;

  bool _isNoteEditing = false;


  @override
  void initState() {
    _titleController = TextEditingController(text: widget.noteModel.title);
    _bodyController = TextEditingController(text: widget.noteModel.body);
    selectedColor = widget.noteModel.color!;
    super.initState();
  }

  @override
  void dispose() {
    _titleController!.dispose();
    _bodyController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isNoteEditing == true? lightGreyColor : darkBackgroundColor,
      body: AbsorbPointer(
        absorbing: _isNoteEditing,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _isNoteEditing == true ? Image.asset("assets/ios_loading.gif", width: 50, height: 50,) : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        icon: Icons.arrow_back,
                        onTap: () => Navigator.pop(context),
                      ),
                      ButtonWidget(icon: Icons.save_outlined, onTap: () {
                        showDialogBoxWidget(
                          context,
                          height: 200,
                          title: "Save Changes ?",
                          onTapYes: () {
                            _editNote();
                            Navigator.pop(context);
                          },
                        );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FormWidget(
                    fontSize: 40,
                    controller: _titleController!,
                    hintText: "Title",
                  ),
                  SizedBox(height: 10),
                  FormWidget(
                    maxLines: 15,
                    fontSize: 20,
                    controller: _bodyController!,
                    hintText: "Start typing...",
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 80,
                    child: ListView.builder(
                      itemCount: predefinedColors.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final singleColor = predefinedColors[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = singleColor.value;
                            });
                          },
                          child: Container(
                            width: 60,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 60,
                            decoration: BoxDecoration(
                                color: singleColor,
                                border: Border.all(width: 3, color: selectedColor == singleColor.value? Colors.white : Colors.transparent),
                                shape: BoxShape.circle),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _editNote() {
    setState(() => _isNoteEditing = true);
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      if(_titleController!.text.isEmpty) {
        toast(message: 'Enter Title');
        setState(() => _isNoteEditing = false);
        return;
      }
      if(_bodyController!.text.isEmpty) {
        toast(message: 'Type something in the body');
        setState(() => _isNoteEditing = false);
        return;
      }
      DatabaseHandler.updateNote(NoteModel(
        id: widget.noteModel.id,
          title: _titleController!.text,
          body: _bodyController!.text,
          color: selectedColor
      )).then((value) {
        _isNoteEditing = false;
        Navigator.pop(context);
      });
    });
  }
}
