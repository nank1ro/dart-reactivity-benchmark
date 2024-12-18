import 'reactive_framework.dart';
import 'utils/logger.dart';
import 'utils/perf_logging.dart';

(int, List<int>, List<int>) _cellx(ReactiveFramework framework, int layers) {
  return framework.withBuild(() {
    final start = (
      framework.signal(1),
      framework.signal(2),
      framework.signal(3),
      framework.signal(4)
    );
    (ISignal<int>, ISignal<int>, ISignal<int>, ISignal<int>) layer = start;
    for (int i = layers; i > 0; i--) {
      final m = layer;
      final s = (
        framework.computed(() => m.$1.read()),
        framework.computed(() => m.$2.read()),
        framework.computed(() => m.$3.read()),
        framework.computed(() => m.$4.read()),
      );

      framework.effect(() => s.$1.read());
      framework.effect(() => s.$2.read());
      framework.effect(() => s.$3.read());
      framework.effect(() => s.$4.read());

      s.$1.read();
      s.$2.read();
      s.$3.read();
      s.$4.read();

      layer = s;
    }

    final end = layer;
    final stopwatch = Stopwatch()..start();
    final before = [
      end.$1.read(),
      end.$2.read(),
      end.$3.read(),
      end.$4.read(),
    ];

    framework.withBatch(() {
      start.$1.write(4);
      start.$2.write(3);
      start.$3.write(2);
      start.$4.write(1);
    });

    final after = [
      end.$1.read(),
      end.$2.read(),
      end.$3.read(),
      end.$4.read(),
    ];

    stopwatch.stop();

    return (stopwatch.elapsedMicroseconds, before, after);
  });
}

typedef _BenchmarkResults = (List<int>, List<int>);

void cellxBench(ReactiveFramework framework) {
  const expected = <int, _BenchmarkResults>{
    1000: ([-3, -6, -2, 2], [-2, -4, 2, 3]),
    2500: ([-3, -6, -2, 2], [-2, -4, 2, 3]),
    5000: ([2, 4, -1, -6], [-2, 1, -4, -4]),
  };

  final results = <int, _BenchmarkResults>{};
  for (final layers in expected.keys) {
    int total = 0;
    for (int i = 0; i < 10; i++) {
      final (elapsed, before, after) = _cellx(framework, layers);
      results[layers] = (before, after);
      total += elapsed;
    }

    logPerfResult(PerfRowStrings(
      framework: framework.name,
      test: 'cellx $layers',
      time: total.toString(),
    ));
  }

  for (final layers in expected.keys) {
    final (before, after) = results[layers]!;
    final (expectedBefore, expectedAfter) = expected[layers]!;

    if (!_listEqual(before, expectedBefore)) {
      logger
          .e('Expected first layer $expectedBefore, found first first $before');
    }
    if (!_listEqual(after, expectedAfter)) {
      logger.e('Expected last layer $expectedAfter, found last first $after');
    }
  }
}

bool _listEqual(List<int> a, List<int> b) {
  if (a.length != b.length) return false;
  for (final (i, v) in a.indexed) {
    if (v != b[i]) return false;
  }
  return true;
}
