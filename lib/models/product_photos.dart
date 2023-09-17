import 'dart:convert';

class ProductPhotos {
  final String first ;
  final String second ;
  final String third ;
  final String fourth ;
  final String fifth ;
  final String sixth ;
  final String seventh ;

  ProductPhotos(
      {
      required this.first,
      required this.second,
      required this.third,
      required this.fourth,
      required this.fifth,
      required this.sixth,
      required this.seventh,
      });

      factory ProductPhotos.fromMap(Map<String,dynamic> map) {
        return ProductPhotos(
        first : map['0'] ,
        second : map['1'] ,
        third : map['2'] ,
        fourth : map['3'] ,
        fifth : map['4'] ,
        sixth : map['5'] ,
        seventh : map['6'] ,
        ); 
      }

      Map<String,dynamic> toMap() => {
        '0' : first ,
        '1' : second ,
        '2' : third ,
        '3' : fourth, 
        '4' : fifth,
        '5' : sixth ,
        '6' : seventh ,
      } ;
}