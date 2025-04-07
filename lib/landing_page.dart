import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';
  double price = 0;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이미지를 선택해주세요.')),
        );
        return;
      }

      // 등록된 상품 처리 (예: 서버 전송, 리스트 저장 등)
      print('상품명: $name');
      print('설명: $description');
      print('가격: $price');
      print('이미지 경로: ${_imageFile!.path}');

      // 이후 처리 로직 여기에 추가
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상품 등록")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 상품명
              TextFormField(
                decoration: InputDecoration(labelText: '상품명'),
                onSaved: (value) => name = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? '상품명을 입력하세요.' : null,
              ),
              // 설명
              TextFormField(
                decoration: InputDecoration(labelText: '설명'),
                onSaved: (value) => description = value ?? '',
              ),
              // 가격
              TextFormField(
                decoration: InputDecoration(labelText: '가격'),
                keyboardType: TextInputType.number,
                onSaved: (value) => price = double.tryParse(value ?? '0') ?? 0,
              ),

              SizedBox(height: 20),

              // 이미지 업로드
              Text("상품 이미지", style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: _pickImage,
                child: _imageFile == null
                    ? Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[300],
                        child: Center(child: Icon(Icons.add_photo_alternate, size: 50)),
                      )
                    : Image.file(
                        _imageFile!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: _submit,
                child: Text("등록하기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
