// ignore_for_file: non_constant_identifier_names

class Machine {
  String? machine_id;
  String? machine_name;
  String? model;
  String? serial_no;
  String? service_barcode;
  String? far_code;
  String? barcode;

  Machine(
      {required this.machine_id,
      required this.machine_name,
      required this.model,
      required this.serial_no,
      required this.service_barcode,
      required this.far_code,
      required this.barcode});

  factory Machine.fromJson(Map<String, dynamic> map) {
    return Machine(
      machine_id: map["machine_id"],
      machine_name: map["machine_name"],
      model: map["model"],
      serial_no: map["serial_no"],
      service_barcode: map["service_barcode"],
      far_code: map["far_code"],
      barcode: map["barcode"],
    );
  }
}
