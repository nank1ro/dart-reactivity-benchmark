import '../reactive_framework.dart';
import '../utils/dep_graph.dart';

void Function() diamond(ReactiveFramework framework) {
  const width = 5;

  return framework.withBuild(() {
    final head = framework.signal(0);
    final current = <Computed<int>>[];
    for (int i = 0; i < width; i++) {
      current.add(
        framework.computed(() => head.read() + 1),
      );
    }

    final sum = framework.computed(() {
      return current.fold(0, (prev, x) => prev + x.read());
    });

    final callCounter = Counter();
    framework.effect(() {
      sum.read();
      callCounter.count++;
    });

    return () {
      framework.withBatch(() {
        head.write(1);
      });
      assert(sum.read() == 2 * width);

      callCounter.count = 0;
      for (int i = 0; i < 500; i++) {
        framework.withBatch(() {
          head.write(i);
        });
        assert(sum.read() == (i + 1) * width);
      }
    };
  });
}
