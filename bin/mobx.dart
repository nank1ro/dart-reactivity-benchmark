import 'package:mobx/mobx.dart' as mobx;
import 'package:dart_reactivity_benchmark/reactive_framework.dart';
import 'package:dart_reactivity_benchmark/run_framework_bench.dart';
import 'package:dart_reactivity_benchmark/utils/create_computed.dart';
import 'package:dart_reactivity_benchmark/utils/create_signal.dart';

final class MobxFramework extends ReactiveFramework {
  const MobxFramework() : super('mobx');

  @override
  Computed<T> computed<T>(T Function() fn) {
    final computed = mobx.Computed(() => fn());
    return createComputed(() => computed.value);
  }

  @override
  void effect(void Function() fn) {
    mobx.autorun((_) => fn());
  }

  @override
  Signal<T> signal<T>(T value) {
    final observable = mobx.Observable(value);
    return createSignal(
      () => observable.value,
      (value) => observable.value = value,
    );
  }

  @override
  void withBatch<T>(T Function() fn) {
    mobx.runInAction(fn);
  }

  @override
  T withBuild<T>(T Function() fn) {
    return fn();
  }
}

void main() {
  const framework = MobxFramework();
  runFrameworkBench(framework);
}
