class CountriesModel {
  Name? name;
  List<String>? tld;

  bool? independent;
  String? status;
  bool? unMember;

  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;

  List<String>? borders;
  int? area;

  String? flag;

  int? population;

  List<String>? timezones;
  List<String>? continents;
  Flags? flags;

  CountriesModel({
    this.name,
    this.tld,
    this.independent,
    this.status,
    this.unMember,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.borders,
    this.area,
    this.flag,
    this.population,
    this.timezones,
    this.continents,
    this.flags,
  });

  CountriesModel.fromJson(Map<String, dynamic> json) {
    if (json["name"] is Map) {
      name = json["name"] == null ? null : Name.fromJson(json["name"]);
    }
    if (json["tld"] is List) {
      tld = json["tld"] == null ? null : List<String>.from(json["tld"]);
    }

    if (json["independent"] is bool) {
      independent = json["independent"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["unMember"] is bool) {
      unMember = json["unMember"];
    }

    if (json["capital"] is List) {
      capital =
          json["capital"] == null ? null : List<String>.from(json["capital"]);
    }
    if (json["altSpellings"] is List) {
      altSpellings = json["altSpellings"] == null
          ? null
          : List<String>.from(json["altSpellings"]);
    }
    if (json["region"] is String) {
      region = json["region"];
    }
    if (json["subregion"] is String) {
      subregion = json["subregion"];
    }
    if (json["languages"] is Map) {
      languages = json["languages"] == null
          ? null
          : Languages.fromJson(json["languages"]);
    }

    if (json["borders"] is List) {
      borders =
          json["borders"] == null ? null : List<String>.from(json["borders"]);
    }
    if (json["area"] is int) {
      area = json["area"];
    }

    if (json["flag"] is String) {
      flag = json["flag"];
    }

    if (json["population"] is int) {
      population = json["population"];
    }

    if (json["timezones"] is List) {
      timezones = json["timezones"] == null
          ? null
          : List<String>.from(json["timezones"]);
    }
    if (json["continents"] is List) {
      continents = json["continents"] == null
          ? null
          : List<String>.from(json["continents"]);
    }
    if (json["flags"] is Map) {
      flags = json["flags"] == null ? null : Flags.fromJson(json["flags"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (name != null) {
      _data["name"] = name?.toJson();
    }
    if (tld != null) {
      _data["tld"] = tld;
    }

    _data["independent"] = independent;
    _data["status"] = status;
    _data["unMember"] = unMember;

    if (capital != null) {
      _data["capital"] = capital;
    }
    if (altSpellings != null) {
      _data["altSpellings"] = altSpellings;
    }
    _data["region"] = region;
    _data["subregion"] = subregion;
    if (languages != null) {
      _data["languages"] = languages?.toJson();
    }

    if (borders != null) {
      _data["borders"] = borders;
    }
    _data["area"] = area;

    _data["flag"] = flag;

    _data["population"] = population;

    if (timezones != null) {
      _data["timezones"] = timezones;
    }
    if (continents != null) {
      _data["continents"] = continents;
    }
    if (flags != null) {
      _data["flags"] = flags?.toJson();
    }

    return _data;
  }
}

class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  PostalCode.fromJson(Map<String, dynamic> json) {
    if (json["format"] is String) {
      format = json["format"];
    }
    if (json["regex"] is String) {
      regex = json["regex"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["format"] = format;
    _data["regex"] = regex;
    return _data;
  }
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({this.latlng});

  CapitalInfo.fromJson(Map<String, dynamic> json) {
    if (json["latlng"] is List) {
      latlng =
          json["latlng"] == null ? null : List<double>.from(json["latlng"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (latlng != null) {
      _data["latlng"] = latlng;
    }
    return _data;
  }
}

class Flags {
  String? png;
  String? svg;
  String? alt;

  Flags({this.png, this.svg, this.alt});

  Flags.fromJson(Map<String, dynamic> json) {
    if (json["png"] is String) {
      png = json["png"];
    }
    if (json["svg"] is String) {
      svg = json["svg"];
    }
    if (json["alt"] is String) {
      alt = json["alt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["png"] = png;
    _data["svg"] = svg;
    _data["alt"] = alt;
    return _data;
  }
}

class Languages {
  String? ron;

  Languages({this.ron});

  Languages.fromJson(Map<String, dynamic> json) {
    if (json["ron"] is String) {
      ron = json["ron"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["ron"] = ron;
    return _data;
  }
}

class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    if (json["common"] is String) {
      common = json["common"];
    }
    if (json["official"] is String) {
      official = json["official"];
    }
    if (json["nativeName"] is Map) {
      nativeName = json["nativeName"] == null
          ? null
          : NativeName.fromJson(json["nativeName"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["common"] = common;
    _data["official"] = official;
    if (nativeName != null) {
      _data["nativeName"] = nativeName?.toJson();
    }
    return _data;
  }
}

class NativeName {
  Ron? ron;

  NativeName({this.ron});

  NativeName.fromJson(Map<String, dynamic> json) {
    if (json["ron"] is Map) {
      ron = json["ron"] == null ? null : Ron.fromJson(json["ron"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (ron != null) {
      _data["ron"] = ron?.toJson();
    }
    return _data;
  }
}

class Ron {
  String? official;
  String? common;

  Ron({this.official, this.common});

  Ron.fromJson(Map<String, dynamic> json) {
    if (json["official"] is String) {
      official = json["official"];
    }
    if (json["common"] is String) {
      common = json["common"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["official"] = official;
    _data["common"] = common;
    return _data;
  }
}
