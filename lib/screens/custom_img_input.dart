import 'package:flutter/material.dart';

class CustomImgInput extends StatefulWidget {

  final TextEditingController mainImgController;
  final String labelText;
  const CustomImgInput({super.key, required this.mainImgController, required this.labelText});

  @override
  State<CustomImgInput> createState() => _CustomImgInputState();
}

class _CustomImgInputState extends State<CustomImgInput> {
  var img;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          alignment: Alignment.center,
          height: 100,
          width: 100,
          child: img != null && img.isNotEmpty  ?  Image.network(img!, fit: BoxFit.fill,) : Text("Rasim kiriting", style: TextStyle(fontSize: 10, color: Colors.grey),),
          decoration: BoxDecoration(
              border: Border.all()
          ),
        ),
        const  SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            onChanged: (value) {
            setState(() {
              img = value;
            });
            },
            controller: widget.mainImgController,
            decoration:  InputDecoration(
                labelText: widget.labelText,
            ),
          ),
        ),
      ],
    );
  }
}
