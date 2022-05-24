import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

newsBuilder(model) {
  return Card(
    child: Column(
      children: [
        Image.network(
          model['urlToImage'].toString(),
          errorBuilder: (context, error, stackTrace) => Image.network(
              'https://th.bing.com/th/id/OIP.05w6-AGlEbstfVaDGnHp-QHaHa?pid=ImgDet&rs=1'),
        ),
        SizedBox(
          height: 10,
        ),
        ExpandablePanel(
            header: Text(
              model['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              hasIcon: true,
            ),
            collapsed: Text(
              model['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            expanded: Text(
              model['content'] ?? 'nothing',
              softWrap: true,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ))
      ],
    ),
  );
}
