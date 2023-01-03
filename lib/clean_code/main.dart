import 'src/args.dart';
import 'src/args_exception.dart';

void main(List<String> args) {
  try {
    Args arg = Args("l,p#,d*", args);
    bool logging = arg.getBoolean("l");
    int port = arg.getInt("d");
    String directory = arg.getString("d");
  } on ArgsException catch (e) {
    print("Argument error: ${e.errorMessage()}\n");
  }
}
