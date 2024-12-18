import 'package:dart_reactivity_benchmark/run_framework_bench.dart';
import 'package:state_beacon/state_beacon.dart' as state_beacon;
import 'package:dart_reactivity_benchmark/reactive_framework.dart';
import 'package:dart_reactivity_benchmark/utils/create_computed.dart';
import 'package:dart_reactivity_benchmark/utils/create_signal.dart';

final class _StateBeaconReactiveFramework extends ReactiveFramework {
  const _StateBeaconReactiveFramework() : super('state_beacon');

  @override
  Computed<T> computed<T>(T Function() fn) {
    final inner = state_beacon.Beacon.derived(fn);
    return createComputed(() => inner.value);
  }

  @override
  void effect(void Function() fn) {
    state_beacon.Beacon.createEffect(() => fn());
  }

  @override
  Signal<T> signal<T>(T value) {
    final signal = state_beacon.Beacon.writable(value);
    return createSignal(() => signal.value, signal.set);
  }

  @override
  void withBatch<T>(T Function() fn) {
    fn();
  }

  @override
  T withBuild<T>(T Function() fn) => fn();
}

void main() {
  runFrameworkBench(
    const _StateBeaconReactiveFramework(),
    testPullCounts: true,
  );
}
