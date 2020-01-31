class Contact {
  final String id;
  final String name;
  final emails;
  final mobile;
  final landline;
  final fax;
  final directdial;

  Contact(this.id, this.name, this.emails, this.mobile, this.landline, this.fax, this.directdial);

  Contact.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        emails = json['emails'],
        mobile = json['mobile'],
        landline = json['landline'],
        fax = json['fax'],
        directdial = json['directdial'];

  Map toJson() {
    return {'id': id, 'name': name, 'email': emails, 'mobiles': mobile, 'landline': landline, 'fax': fax, 'directdial': directdial};
  }
}