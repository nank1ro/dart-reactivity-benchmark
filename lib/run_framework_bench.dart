import 'cellx_bench.dart';
// import 'framework_type.dart';
import 'reactive_framework.dart';

void runFrameworkBench(ReactiveFramework framework, {bool? testPullCounts}) {
  // final info =
  //     FrameworkInfo(framework: framework, testPullCounts: testPullCounts);

  cellxBench(framework);
}
