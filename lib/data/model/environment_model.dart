
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum Environment { development, staging, production }

class EnvironmentModel extends Equatable {
  const EnvironmentModel({
    required this.environment,
    required this.name,
    required this.baseUrl,
    required this.apiVersion,
    required this.baseUrlImage,
    this.color,
  });

  // development
  factory EnvironmentModel.development({
    String apiVersion = 'v1',
    String? name,
    String? baseUrl,
    String? baseUrlImage,
    Color? color,
  }) {
    return EnvironmentModel(
        environment: Environment.development,
        name: name ?? 'Dev',
        apiVersion: apiVersion,
        baseUrl: baseUrl ?? 'http://188.166.244.61/api/$apiVersion',
        baseUrlImage: baseUrlImage ?? 'http://188.166.244.61/',
        color: color ?? Colors.green);
  }

  // staging
  factory EnvironmentModel.staging({
    String apiVersion = 'v1',
    String? name,
    String? baseUrl,
    String? baseUrlImage,
    Color? color,
  }) {
    return EnvironmentModel(
        environment: Environment.staging,
        name: name ?? 'Staging',
        apiVersion: apiVersion,
        baseUrl: baseUrl ?? 'http://staging.api.cambizexpress.camsolutiondemo.com/$apiVersion',
        baseUrlImage: baseUrlImage ?? 'http://staging.api.cambizexpress.camsolutiondemo.com/',
        color: color ?? Colors.orange);
  }

  // production
  factory EnvironmentModel.production({
    String apiVersion = 'v1',
    String? name,
    String? baseUrl,
    String? baseUrlImage,
    Color? color,
  }) {
    return EnvironmentModel(
        environment: Environment.production,
        name: name ?? 'Production',
        apiVersion: apiVersion,
        baseUrl: baseUrl ?? 'http://188.166.244.61/api/$apiVersion',
        baseUrlImage: baseUrlImage ?? 'http://188.166.244.61/',
        color: color);
  }

  @override
  List<Object?> get props =>
      [environment, name, apiVersion, baseUrl, baseUrlImage, color];

  final Environment environment;
  final String name;
  final String apiVersion;
  final String baseUrl;
  final String baseUrlImage;
  final Color? color;
}
