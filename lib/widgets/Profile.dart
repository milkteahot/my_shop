import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipOval(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Image(
              image: NetworkImage(
                  "https://png.pngtree.com/png-vector/20190330/ourlarge/pngtree-continuous-line-drawing-of-minimalist-cat-animals-png-image_895421.jpg"
              ),
            ),
          ),
        ),
    );
  }
}
