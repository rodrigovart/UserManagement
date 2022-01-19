class UserModel {
  final int? id;
  final String nome;
  final String email;
  final String avatar;

  const UserModel(
      {this.id, required this.nome, required this.email, required this.avatar});
}
