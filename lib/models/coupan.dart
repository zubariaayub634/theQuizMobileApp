class Coupan{
 String _coupanimage;
  String _coupanname;

  Coupan(this._coupanimage, this._coupanname);

  set coupanName(String path) {
    this._coupanname = path;
  }

  set coupanImage(String name) {
    this._coupanimage = name;
  }

  String get coupanName => this._coupanname;
  String get coupanImage => this._coupanimage;
}