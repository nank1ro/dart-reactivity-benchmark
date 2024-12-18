import '../reactive_framework.dart';
import '../utils/dep_graph.dart';

void Function() unstable(ReactiveFramework framework) {
  return framework.withBuild(() {
    final head = framework.signal(0);
    final double = framework.computed(() => head.read() * 2);
    final inverse = framework.computed(() => -head.read());
    final current = framework.computed(() {
      var result = 0;
      for (int i = 0; i < 20; i++) {
        result += head.read() % 2 == 1 ? double.read() : inverse.read();
      }
      return result;
    });

    final callCounter = Counter();
    framework.effect(() {
      current.read();
      callCounter.count++;
    });

    return () {
      framework.withBatch(() {
        head.write(1);
      });
      assert(current.read() == 40);

      callCounter.count = 0;
      for (int i = 0; i < 100; i++) {
        framework.withBatch(() {
          head.write(i);
        });
      }
    };
  });
}
