List<String> genres = ['homme', 'femme'];

class Utilisateur {
  String nom;
  String prenom;
  String genre;
  var age;
  String password;
  String email;
  String nationalite;
  String tel;

  Utilisateur({
    this.nom,
    this.prenom,
    this.genre,
    this.age,
    this.password,
    this.email,
    this.nationalite,
    this.tel,
  });

  @override
  String toString() {
    return 'nom: $nom, prenom: $prenom, genre: $genre, age: $age, password: $password, email: $email, nationalite: $nationalite';
  }
}
