class Artista {
  final int id;
  final String nome;

  Artista({
    this.id,
    this.nome,
  });

  factory Artista.fromJson(Map<String, dynamic> json) {
    return Artista(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
