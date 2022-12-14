import 'main.dart' as app;
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.DEVELOPMENT;
  app.main();
}
