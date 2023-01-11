class EmpresasProvider {
  late List<Map<String, dynamic>> _empresas;
  static final EmpresasProvider _instancia = EmpresasProvider._privado();
  EmpresasProvider._privado() {
    _empresas = [
      // {'nombre': 'Empresa 1', 'description': 'descripcion de la empresa'},
    ];
  }

  factory EmpresasProvider() {
    return _instancia;
  }

  List<Map<String, dynamic>> get empresas {
    return _empresas;
  }

  void agregarEmpresa(Map<String, dynamic> nuevaempresa) {
    _empresas.add(nuevaempresa);
  }
}
