import 'cellx_bench.dart';
import 'dynamic_bench.dart';
import 'framework_type.dart';
import 'kairo_bench.dart';
import 'mol_bench.dart';
import 'reactive_framework.dart';
import 's_bench.dart';
import 'utils/perf_logging.dart';

Future<void> runFrameworkBench(ReactiveFramework framework,
    {bool? testPullCounts}) async {
  final info =
      FrameworkInfo(framework: framework, testPullCounts: testPullCounts);

  printPerfReportHeaders();
  await kairoBench(framework);
  await molBench(framework);
  sbench(framework);
  cellxBench(framework);
  await dynamicBench(info);
}
