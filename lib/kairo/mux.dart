import '../reactive_framework.dart';

void Function() mux(ReactiveFramework framework) {
  return framework.withBuild(() {
    final heads = List.generate(100, (_) => framework.signal(0));
    final mux = framework.computed(() {
      return Map.fromEntries(
        heads.map((h) => h.read()).toList().asMap().entries,
      );
    });

    final splited = heads
        .asMap()
        .entries
        .map((e) => framework.computed(() => mux.read()[e.key]!))
        .map((x) => framework.computed(() => x.read() + 1))
        .toList();

    for (final x in splited) {
      framework.effect(() => x.read());
    }

    return () {
      for (int i = 0; i < 10; i++) {
        framework.withBatch(() {
          heads[i].write(i);
        });
        assert(splited[i].read() == i + 1);
      }

      for (int i = 0; i < 10; i++) {
        framework.withBatch(() {
          heads[i].write(i * 2);
        });
        assert(splited[i].read() == i * 2 + 1);
      }
    };
  });
}
