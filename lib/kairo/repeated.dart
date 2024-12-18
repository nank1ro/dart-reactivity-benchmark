import '../reactive_framework.dart';
import '../utils/dep_graph.dart';

void Function() repeatedObservers(ReactiveFramework framework) {
  const size = 30;

  return framework.withBuild(() {
    final head = framework.signal(0);
    final current = framework.computed(() {
      var result = 0;
      for (int i = 0; i < size; i++) {
        // tbh I think it's meaningless to be this big...
        result += head.read();
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
      assert(current.read() == size);
      callCounter.count = 0;
      for (int i = 0; i < 100; i++) {
        framework.withBatch(() {
          head.write(i);
        });
        assert(current.read() == i * size);
      }
    };
  });
}
