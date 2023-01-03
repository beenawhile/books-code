import 'package:books_code/effective_unit_test/3_test_doubles/fake_object.dart';
import 'package:test/test.dart';

void main() {
  group(
    "UserController",
    () {
      const user = User(id: 111, name: "Unix");
      const invalidUser = User(id: 222, name: "Windows");
      test(
        ".saveUser should save new user",
        () async {
          final repository = FakeSpyUserRepository();
          final controller = UserController(repository);

          await controller.saveUser(user);

          expect(repository.received(user), true);
        },
      );

      test(
        ".findById should return a user if there is or null if there is not",
        () async {
          final repository = FakeSpyUserRepository([user]);
          final controller = UserController(repository);

          expect(controller.findUserById(user.id), completion(equals(user)));
          expect(controller.findUserById(invalidUser.id),
              completion(equals(null)));
        },
      );

      test(
        ".findByName should return a user if there is or null if there is not",
        () async {
          final repository = FakeSpyUserRepository([user]);
          final controller = UserController(repository);

          final result1 = await controller.findUserByName(user.name);
          final result2 = await controller.findUserByName(invalidUser.name);

          expect(result1, equals(user));
          expect(result2, equals(null));
        },
      );
    },
  );
}

class FakeSpyUserRepository implements UserRepository {
  FakeSpyUserRepository([List<User>? users]) : users = users ?? [];
  final List<User> users;

  bool received(User user) {
    return users.contains(user);
  }

  @override
  void save(User user) {
    users.add(user);
  }

  @override
  User? findById(int id) {
    for (final user in users) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }

  @override
  User? findByName(String name) {
    for (final user in users) {
      if (user.name == name) {
        return user;
      }
    }
    return null;
  }
}
