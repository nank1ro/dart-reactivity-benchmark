import '../framework_type.dart';
import 'logger.dart';

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

void verifyBenchResult(FrameworkInfo info, TestConfig config,
    TimingResult<TestResult> timingResult) {
  final FrameworkInfo(:framework, :testPullCounts) = info;
  final TestConfig(:expected) = config;
  final TimingResult<TestResult>(:result) = timingResult;

  if (expected.sum != 0 && expected.sum != result.sum) {
    logger.e('sum ${framework.name} ${config.name} result: ${expected.sum}');
  }

  if (expected.count != 0 &&
      (config.readFraction == 1 || testPullCounts == true) &&
      testPullCounts != false &&
      expected.count != result.count) {
    logger
        .e('count ${framework.name} ${config.name} result: ${expected.count}');
  }
}
