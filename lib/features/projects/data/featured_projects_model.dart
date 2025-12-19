import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_enums.dart';

class FeaturedProjectsModel {
  final PointOfView pointOfView;
  final String title;
  final String description;
  final String image;
  final String externalLink;

  FeaturedProjectsModel({
    required this.pointOfView,
    required this.title,
    required this.description,
    required this.externalLink,
    required this.image,
  });
  String get getExternalLink {
    switch (pointOfView) {
      case PointOfView.gitHub:
        return '';
      case PointOfView.playStore:
        return '';
      case PointOfView.appStore:
        return '';
      case PointOfView.webSite:
        return '';
      case PointOfView.secured:
        return '';
    }
  }

  get getIcon {
    switch (pointOfView) {
      case PointOfView.gitHub:
        return Icons.code;
      case PointOfView.playStore:
        return Icons.shop;
      case PointOfView.appStore:
        return Icons.apple;
      case PointOfView.webSite:
        return Icons.web;
      case PointOfView.secured:
        return Icons.desktop_windows;
    }
  }
}
