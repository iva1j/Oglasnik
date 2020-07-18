import 'package:Oglasnik/utils/colorThemes.dart';
import 'package:Oglasnik/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GalleryExampleItem {
  GalleryExampleItem({this.id, this.resource, this.isSvg = false});

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail(
      {Key key, this.galleryExampleItem, this.onTap})
      : super(key: key);

  final GalleryExampleItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          color: alertDialogBorderColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(
              left: SizeConfig.blockSizeHorizontal * 5,
              right: SizeConfig.blockSizeHorizontal * 5),
          child: Hero(
            tag: galleryExampleItem.id,
            child: Image.asset(
              galleryExampleItem.resource,
              height: 194,
            ),
          ),
        ),
      ),
    );
  }
}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource: "assets/img1.jpg",
  ),
  GalleryExampleItem(
    id: "tag2",
    resource: "assets/img2.jpg",
  ),
  GalleryExampleItem(
    id: "tag3",
    resource: "assets/img3.jpg",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource: "assets/img4.jpg",
  ),
];
