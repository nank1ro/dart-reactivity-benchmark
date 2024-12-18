import 'cellx_bench.dart';
import 'dynamic_bench.dart';
import 'framework_type.dart';
import 'reactive_framework.dart';
import 'utils/perf_logging.dart';

Future<void> runFrameworkBench(ReactiveFramework framework,
    {bool? testPullCounts}) async {
  final info =
      FrameworkInfo(framework: framework, testPullCounts: testPullCounts);

  logPerfResult(perfReportHeaders());
  cellxBench(framework);
  await dynamicBench(info);
}
