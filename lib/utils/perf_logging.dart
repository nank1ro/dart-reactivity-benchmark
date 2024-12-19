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

const _frameworkWidth = 22;
const _testWidth = 60;
const _timeWidth = 9;

String _percent(num n) {
  return '${(n * 100).toStringAsFixed(1)}%';
}

PerfRowStrings _trimColumns(PerfRowStrings row) {
  String trimmed(String value, int length) {
    return value
        .trim()
        .substring(0, length >= value.length ? value.length : length);
  }

  return PerfRowStrings(
    framework: trimmed(row.framework, _frameworkWidth),
    test: trimmed(row.test, _testWidth),
    time: trimmed(row.time, _timeWidth),
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
  TimingResult<TestResult> result,
) {
  return PerfRowStrings(
    framework: framework,
    test: '${makeTitle(config)} (${config.name ?? ''})',
    time: result.timing.time.toString(),
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
