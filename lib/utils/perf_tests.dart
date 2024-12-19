import '../framework_type.dart';
import '../reactive_framework.dart';

class TestResult {
  const TestResult({
    required this.sum,
    required this.count,
  });

  final num sum;
  final int count;
}

class TestTiming {
  const TestTiming(this.time);
  final int time;
}

class TimingResult<T> {
  const TimingResult(this.result, this.timing);

  final T result;
  final TestTiming timing;
}

void verifyBenchResult(ReactiveFramework framework, TestConfig config,
    TimingResult<TestResult> timingResult) {
  final TestConfig(:expected) = config;
  final TimingResult<TestResult>(:result) = timingResult;

  if (expected.sum != 0 && expected.sum != result.sum) {
    print(
        '\x1B[31msum ${framework.name} ${config.name} result:${result.sum} expected:${expected.sum}\x1B[0m');
  }

  if (expected.count != 0 && expected.count != result.count) {
    print(
        '\x1B[31mcount ${framework.name} ${config.name} result:${result.count} expected:${expected.count}\x1B[0m');
  }
}
