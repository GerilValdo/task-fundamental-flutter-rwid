import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:task_flutter_rwid/core/data/entity/news_model.dart';
import '../../main.dart';
import './widgets/custom_button.dart';
import './widgets/custom_text_form.dart';

class NewsForm extends StatefulWidget {
  final NewsModel? news;
  final String titleAppBar;
  const NewsForm({super.key, required this.titleAppBar, this.news});
  @override
  State<NewsForm> createState() => _NewsFormState();
}

class _NewsFormState extends State<NewsForm> {
  Box<NewsModel> newsBox = objectbox.store.box<NewsModel>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  XFile? _image;
  DateTime? _selectedDate;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    if (widget.news != null) {
      _titleController.text = widget.news?.title ?? '';
      _contentController.text = widget.news?.content ?? '';
      _categoryController.text = widget.news?.category ?? '';
      _selectedDate = widget.news?.date;
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.titleAppBar),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              children: [
                Form(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextForm(
                        title: 'Title',
                        controller: _titleController,
                      ),
                      CustomTextForm(
                        title: 'Content',
                        maxLine: 4,
                        controller: _contentController,
                      ),
                      CustomTextForm(
                        title: 'Category',
                        controller: _categoryController,
                        inputAction: TextInputAction.done,
                      ),
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black54, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: _selectedDate == null
                                  ? Text('No Date Selected')
                                  : Text(DateFormat('dd MMMM yyyy')
                                      .format(_selectedDate!.toLocal())),
                            ),
                          ),
                          Flexible(
                            child: CustomButton(
                              fontSize: 12,
                              bgColor: Colors.white,
                              fgColor: Colors.blue,
                              title: 'Select Date',
                              onPressed: () {
                                _selectDate(context);
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 170,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          border: Border.all(color: Colors.black45, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: _image == null
                            ? Text('No Image Selected')
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.file(
                                  File(_image!.path),
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      CustomButton(
                        bgColor: Colors.white,
                        fgColor: Colors.blue,
                        title: 'Select Image',
                        onPressed: () {
                          _pickImageFromGallery();
                        },
                      ),
                      CustomButton(
                        bgColor: Colors.blue,
                        fgColor: Colors.white,
                        title: 'Save',
                        onPressed: () {
                          NewsModel news = NewsModel(
                            id: widget.news?.id ?? 0,
                            title: _titleController.text,
                            content: _contentController.text,
                            category: _categoryController.text,
                            date: _selectedDate,
                            imageUrl: _image?.path,
                          );

                          newsBox.put(news);

                          setState(() {
                            _titleController.clear();
                            _contentController.clear();
                            _categoryController.clear();
                            _selectedDate = null;
                            _image = null;
                          });

                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
