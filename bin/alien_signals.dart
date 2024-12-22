import 'package:alien_signals/alien_signals.dart' as alien_signals;
import 'package:dart_reactivity_benchmark/reactive_framework.dart';
import 'package:dart_reactivity_benchmark/run_framework_bench.dart';
import 'package:dart_reactivity_benchmark/utils/create_computed.dart';
import 'package:dart_reactivity_benchmark/utils/create_signal.dart';

final class _AlientSignalsReactiveFramework extends ReactiveFramework {
  const _AlientSignalsReactiveFramework() : super('alien_signals');

  @override
  Computed<T> computed<T>(T Function() fn) {
    final inner = alien_signals.computed<T>((_) => fn());
    return createComputed(inner.get);
  }

  @override
  void effect(void Function() fn) {
    alien_signals.effect(fn);
  }

  @override
  Signal<T> signal<T>(T value) {
    final inner = alien_signals.signal(value);
    return createSignal(inner.get, inner.set);
  }

  @override
  void withBatch<T>(T Function() fn) {
    alien_signals.startBatch();
    fn();
    alien_signals.endBatch();
  }

  @override
  T withBuild<T>(T Function() fn) => fn();
}

void main() {
  runFrameworkBench(
    const _AlientSignalsReactiveFramework(),
  );
}
