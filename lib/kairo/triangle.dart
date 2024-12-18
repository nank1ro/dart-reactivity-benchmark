import '../reactive_framework.dart';
import '../utils/dep_graph.dart';

void Function() triangle(ReactiveFramework framework) {
  const width = 10;
  return framework.withBuild(() {
    final head = framework.signal(0);
    var current = head as ISignal<int>;
    final list = <ISignal<int>>[];

    for (int i = 0; i < width; i++) {
      final c = current;
      list.add(current);
      current = framework.computed(() {
        return c.read() + 1;
      });
    }

    final sum = framework.computed(() {
      return list.map((x) => x.read()).reduce((a, b) => a + b);
    });

    final callCounter = Counter();
    framework.effect(() {
      sum.read();
      callCounter.count++;
    });

    return () {
      final constant = _count(width);
      framework.withBatch(() {
        head.write(1);
      });
      assert(sum.read() == constant);

      callCounter.count = 0;
      for (int i = 0; i < 100; i++) {
        framework.withBatch(() {
          head.write(i);
        });
        assert(sum.read() == constant - width + i * width);
      }
    };
  });
}

int _count(int number) {
  return List.generate(number, (i) => i + 1).reduce((x, y) => x + y);
}
