import '../framework_type.dart';
import 'perf_tests.dart';

class PerfRowStrings {
  const PerfRowStrings({
    required this.framework,
    required this.test,
    required this.time,
  });

  final String framework;
  final String test;
  final String time;
}

String _percent(num n) {
  return '${(n * 100).toStringAsFixed(1)}%';
}

PerfRowStrings _trimColumns(PerfRowStrings row) {
  return PerfRowStrings(
    framework: row.framework.trim(),
    test: row.test.trim(),
    time: row.time.trim(),
  );
}

void logPerfResult(PerfRowStrings row) {
  final trimmed = _trimColumns(row);
  print('| ${trimmed.framework} | ${trimmed.test} | ${trimmed.time} |');
}

void printPerfReportHeaders() {
  logPerfResult(PerfRowStrings(
    framework: 'Framework',
    test: 'Test Case',
    time: 'Time (μs)',
  ));
  logPerfResult(PerfRowStrings(
    framework: '---',
    test: '---',
    time: '---',
  ));
}

PerfRowStrings perfRowStrings(
  String framework,
  TestConfig config,
  TimingResult<TestResult> timingResult,
) {
  final TestConfig(:expected) = config;
  final TimingResult<TestResult>(:result, :timing) = timingResult;

  final sum = expected.sum != 0 && expected.sum != result.sum
      ? 'sum: fial'
      : 'sum: pass';
  final count = expected.count != 0 && expected.count != result.count
      ? 'count: fail'
      : 'count: pass';

  return PerfRowStrings(
    framework: framework,
    test: '${makeTitle(config)} (${config.name ?? ''}, $sum, $count)',
    time: timing.time.toString(),
  );
}

String makeTitle(TestConfig config) {
  final TestConfig(
    :width,
    :totalLayers,
    :staticFraction,
    :nSources,
    :readFraction
  ) = config;
  final dyn = staticFraction < 1 ? ' - dynamic' : '';
  final read = readFraction < 1 ? ' - read ${_percent(readFraction)}' : '';
  final sources = ' - $nSources sources';

  return '${width}x$totalLayers$sources$dyn$read';
}
