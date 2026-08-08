package thoughtscript.io.example

class Example {

  var _name : String

  construct(name : String) {
    this._name = name
  }

  property get Name() : String {
    return this._name
  }

  property set Name(name : String) {
    this._name = name
  }
}

var e = new Example("my name")
print(e.Name)

e.Name = "new name"
print(e.Name)