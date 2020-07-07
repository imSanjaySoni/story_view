import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProfileInformationRow extends StatelessWidget {
  final DateTime createdAt;
  final double top;
  final String avatarUrl;
  final String playerUsername;
  final Widget verifyWidget;

  const ProfileInformationRow(
      {Key key,
      @required this.createdAt,
      this.top = 70,
      @required this.avatarUrl,
      @required this.playerUsername,
      @required this.verifyWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        top: top,
        left: 15,
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          avatarUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        playerUsername,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      verifyWidget ?? Container()
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    getCapitalised(
                        timeago.format(createdAt, allowFromNow: true)),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

getCapitalised(String val) {
  val = val.replaceAll('_', ' ');
  return val.substring(0, 1).toUpperCase() + val.substring(1, val.length);
}
