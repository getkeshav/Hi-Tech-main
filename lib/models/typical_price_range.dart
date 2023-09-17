import 'dart:convert';

class PriceRange {
  final String start ;
  final String end ;
  

  PriceRange(
      {
      required this.start,
      required this.end,
      });

      factory PriceRange.fromMap(Map<String,dynamic> map) {
        return PriceRange(
        start : map['0'] ,
        end : map['1'] ,
        ); 
      }

      Map<dynamic,String> toMap() => {
        '0' : start ,
        '1' : end ,
      } ;
}