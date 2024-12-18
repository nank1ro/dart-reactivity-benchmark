import 'cellx_bench.dart';
// import 'framework_type.dart';
import 'reactive_framework.dart';
import 'utils/perf_logging.dart';

void runFrameworkBench(ReactiveFramework framework, {bool? testPullCounts}) {
  // final info =
  //     FrameworkInfo(framework: framework, testPullCounts: testPullCounts);

  logPerfResult(perfReportHeaders());
  cellxBench(framework);
}
