import '../reactive_framework.dart';
import '../utils/dep_graph.dart';

void Function() broadPropagation(ReactiveFramework framework) {
  final head = framework.signal(0);
  ISignal<int> last = head;
  final callCounter = Counter();

  for (int i = 0; i < 50; i++) {
    final current = framework.computed(() {
      return head.read() + i;
    });

    final current2 = framework.computed(() {
      return current.read() + 1;
    });

    framework.effect(() {
      current2.read();
      callCounter.count++;
    });

    last = current2;
  }

  return () {
    framework.withBatch(() {
      head.write(1);
    });

    callCounter.count = 0;
    for (int i = 0; i < 50; i++) {
      framework.withBatch(() {
        head.write(i);
      });
      assert(last.read() == i + 50);
    }
  };
}
