import 'package:dart_reactivity_benchmark/run_framework_bench.dart';
import 'package:solidart/solidart.dart' as solidart;
import 'package:dart_reactivity_benchmark/reactive_framework.dart';
import 'package:dart_reactivity_benchmark/utils/create_computed.dart';
import 'package:dart_reactivity_benchmark/utils/create_signal.dart';

final class _SolidartReactiveFramework extends ReactiveFramework {
  const _SolidartReactiveFramework() : super('solidart');

  @override
  Computed<T> computed<T>(T Function() fn) {
    final inner = solidart.Computed(fn);
    return createComputed(() => inner());
  }

  @override
  void effect(void Function() fn) {
    solidart.Effect((_) => fn());
  }

  @override
  Signal<T> signal<T>(T value) {
    final solidart.Signal<T>(:call, :set) = solidart.Signal(value);
    return createSignal(call, set);
  }

  @override
  void withBatch<T>(T Function() fn) {
    fn();
  }

  @override
  T withBuild<T>(T Function() fn) => fn();
}

void main() {
  runFrameworkBench(const _SolidartReactiveFramework(), testPullCounts: true);
}
