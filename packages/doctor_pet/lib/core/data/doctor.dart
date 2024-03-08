

class doctor {
  String iddoctor ;
  String namedoctor;
  String email ;
  DateTime day;
  String phonenum;
  bool accepted;
 
  

  doctor({required this.day,required this.iddoctor,required this.namedoctor,required this.email,required this.phonenum,  this.accepted = false,});
}