
class IdDevice{
  
  final String idDevice;

  IdDevice({
   required this.idDevice
  });

     
 factory  IdDevice.fromJson(Map<String, dynamic> json) {
    return IdDevice(
      
     
      idDevice:  json["id"].toString()
    );
  }
}