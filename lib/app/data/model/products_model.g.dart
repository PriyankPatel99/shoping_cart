// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      json['id'] as int?,
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['description'] as String?,
      json['category'] as String?,
      json['image'] as String?,
      json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
