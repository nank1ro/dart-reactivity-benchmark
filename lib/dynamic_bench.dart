import 'config.dart';
import 'framework_type.dart';
import 'reactive_framework.dart';
import 'utils/bench_repeat.dart';
import 'utils/dep_graph.dart';
import 'utils/perf_logging.dart';
import 'utils/perf_tests.dart';

Future<void> dynamicBench(ReactiveFramework framework,
    {int testRepeats = 1}) async {
  for (final config in perfTests) {
    final TestConfig(:iterations, :readFraction) = config;
    final counter = Counter();
    int runOnce() {
      try {
        final graph = makeGraph(framework, config, counter);
        return runGraph(graph, iterations, readFraction, framework);
      } catch (e) {
        return -1;
      }
    }

    // warm up
    runOnce();

    final timingResult = await fastestTest(testRepeats, () {
      counter.count = 0;
      final sum = runOnce();
      return TestResult(sum: sum, count: counter.count);
    });

    logPerfResult(perfRowStrings(framework.name, config, timingResult));
  }
}
