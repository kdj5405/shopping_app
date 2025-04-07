import 'package:flutter/material.dart';

class landingpage extends StatefulWidget {
  @override
  _landingpageState createState() => _landingpageState();
}

class _landingpageState extends State<landingpage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';
  double price = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("상품 등록")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: '상품명'),
                onSaved: (value) => name = value ?? '',
                validator: (value) =>
                    value!.isEmpty ? '상품명을 입력하세요.' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '설명'),
                onSaved: (value) => description = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '가격'),
                keyboardType: TextInputType.number,
                onSaved: (value) => price = double.tryParse(value ?? '0') ?? 0,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("등록하기"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // 등록된 상품 처리 로직
                    print('상품 등록됨: $name / $description / $price');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
