import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dotenv/dotenv.dart';

void loadDotenv() async {
  await dotenv.load();
}
