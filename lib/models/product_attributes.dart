// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductAttributes {
  final String Features;
  final String SimSlots;
  final String OperatingSystem;
  final String BroadbandGeneration;
  final String LensQuantity;
  final String CellularNetwork;

  ProductAttributes(
      {
      required this.Features,
      required this.SimSlots,
      required this.OperatingSystem,
      required this.BroadbandGeneration,
      required this.LensQuantity,
      required this.CellularNetwork});

      factory ProductAttributes.fromMap(Map<String,dynamic> map) {
        return ProductAttributes(
        Features : map['Features'] ,
        SimSlots : map['SIM Slots'] ,
        OperatingSystem : map['Operating System'] ,
        BroadbandGeneration : map['Broadband Generation'] ,
        LensQuantity : map['Lens Quantity'] ,
        CellularNetwork : map['Cellular Network'] ,
        ); 
      }

      Map<String,dynamic> toMap() => {
        'Features' : Features ,
        'SIM Slots' : SimSlots ,
        'Operating System' : OperatingSystem ,
        'Broadband Generation' : BroadbandGeneration, 
        'Lens Quantity' : LensQuantity,
        'Cellular Networ' : CellularNetwork ,
      } ;
}
