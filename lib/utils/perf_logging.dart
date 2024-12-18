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
        .substring(0, length >= value.length ? value.length : length)
        .padRight(length);
  }

  return PerfRowStrings(
    framework: trimmed(row.framework, _frameworkWidth),
    test: trimmed(row.test, _testWidth),
    time: trimmed(row.time, _timeWidth),
  );
}

bool printPerfResultLog = true;
void logPerfResult(PerfRowStrings row) {
  if (!printPerfResultLog) return;

  final trimmed = _trimColumns(row);
  final colums = [trimmed.framework, trimmed.test, trimmed.time];

  print(colums.join(' , '));
}

PerfRowStrings perfReportHeaders() {
  return _trimColumns(PerfRowStrings(
    framework: 'framework',
    test: 'test',
    time: 'time (μs)',
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
