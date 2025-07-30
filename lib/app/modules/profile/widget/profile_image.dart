import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final String? name;
  final String? imageUrl;

  ProfileImageWidget({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: CircleAvatar(
        radius: 26.0,
        backgroundColor: Theme.of(context).primaryColor,
        backgroundImage: imageUrl != null && imageUrl!.isNotEmpty ? CachedNetworkImageProvider(imageUrl!) : null,
        child:
            imageUrl == null || imageUrl!.isEmpty
                ? Text(name != null && name!.length >= 1 ? '${name![0]}' : '', style: TextStyle(fontSize: 48, color: Colors.white))
                : null,
      ),
    );
  }
}
