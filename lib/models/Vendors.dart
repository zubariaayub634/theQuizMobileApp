class Vendors{
 String _vendorimagepath;
  String _vendorename;

  Vendors(this._vendorename, this._vendorimagepath);

  set vendorImagepath(String path) {
    this._vendorimagepath = path;
  }

  set imagename(String name) {
    this._vendorename = name;
  }

  String get vendorImagePath => this._vendorimagepath;
  String get vendorName => this._vendorename;
}