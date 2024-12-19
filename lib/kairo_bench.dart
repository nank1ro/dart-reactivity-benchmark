import 'kairo/utils.dart';
import 'utils/bench_repeat.dart';
import 'utils/perf_logging.dart';
import 'reactive_framework.dart';
import 'kairo/avoidable.dart';
import 'kairo/broad.dart';
import 'kairo/deep.dart';
import 'kairo/diamond.dart';
import 'kairo/mux.dart';
import 'kairo/repeated.dart';
import 'kairo/triangle.dart';
import 'kairo/unstable.dart';

final cases = [
  (avoidablePropagation, 'avoidablePropagation'),
  (broadPropagation, 'broadPropagation'),
  (deepPropagation, 'deepPropagation'),
  (diamond, 'diamond'),
  (mux, 'mux'),
  (repeatedObservers, 'repeatedObservers'),
  (triangle, 'triangle'),
  (unstable, 'unstable'),
];

Future<void> kairoBench(ReactiveFramework framework) async {
  for (final (testCase, name) in cases) {
    final iter = framework.withBuild(() {
      final iter = testCase(framework);
      return iter;
    });

    // warm up
    KairoState state = iter();

    final timingResult = await fastestTest(10, () {
      for (int i = 0; i < 1000; i++) {
        final itemState = iter();
        if (state == KairoState.success) {
          state = itemState;
        }
      }
      return null;
    });

    logPerfResult(PerfRowStrings(
      framework: framework.name,
      test: 'kairo $name (${state.name})',
      time: timingResult.timing.time.toString(),
    ));
  }
}
