class UserController {
  const UserController(this._repository);

  final UserRepository _repository;

  Future<void> saveUser(User user) async {
    _repository.save(user);
  }

  Future<User?> findUserById(int id) async {
    return _repository.findById(id);
  }

  Future<User?> findUserByName(String name) async {
    return _repository.findByName(name);
  }
}

abstract class UserRepository {
  void save(User user);
  User? findById(int id);
  User? findByName(String name);
}

class User {
  const User({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;
}
