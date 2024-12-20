# Dart Reactivity Benchmark

Benchmark comparing different standalone Dart reactivity/signals frameworks.

## Usage

Dart VM
```bash
dart run bin/[framework_name].dart
```

Run all benchamrks
```bash
bash bench.sh
```

## Score Ranking

<!-- Rank Table -->
| Rank | Framework | Score |
|---|---|---|
| 🥇 | [alien_signals](https://pub.dev/packages/alien_signals) | 28.28 |
| 🥈 | [preact_signals](https://pub.dev/packages/preact_signals) | 22.21 |
| 🥉 | [signals](https://pub.dev/packages/signals) | 19.49 |
| 4 | [state_beacon](https://pub.dev/packages/state_beacon) | 14.75 |
| 5 | [mobx](https://pub.dev/packages/mobx) | 5.77 |
| 6 | [solidart](https://pub.dev/packages/solidart) | 3.86 |
<!-- Rank Table End -->

> [!TIP]
> ## Ranking algorithm
>
> 1. The score of the test with the shortest test time is 1.0, and the score of the other frameworks is the time of the same test divided by the shortest time. For example, if the shortest time is 100ms and the time of other frameworks is 200ms, the scores of the others are 0.5
> 2. If the test case status is fail, the score is 0
> 3. If the test case status contains sun and count, and both count and sum are pass, the score is calculated as 1 algorithm. If only one of them is fail, the score is divided by 2, and if all fail, the score is 0
> 4. The total score of each framework is the sum of the total scores of all test cases.

## Benchmark results of each framework

<!-- Benchmark Table -->
| Test Case | alien_signals | signals | preact_signals | solidart | state_beacon | mobx |
|---|---|---|---|---|---|---|
| kairo avoidablePropagation | 210.10ms | 212.91ms | 193.91ms | 2.1981s | 174.64ms (fail) | 2.3296s |
| kairo broadPropagation | 412.30ms | 461.72ms | 422.23ms | 5.4777s | 6.88ms (fail) | 4.3849s |
| kairo deepPropagation | 165.97ms | 175.18ms | 143.79ms | 2.0125s | 141.13ms (fail) | 1.5490s |
| kairo diamond | 248.31ms | 285.46ms | 262.84ms | 3.4534s | 198.99ms (fail) | 2.4415s |
| kairo mux | 391.88ms | 408.90ms | 370.60ms | 2.0271s | 194.19ms (fail) | 1.7994s |
| kairo repeatedObservers | 22.17ms | 44.85ms | 40.23ms | 214.44ms | 53.75ms (fail) | 237.07ms |
| kairo triangle | 95.75ms | 101.53ms | 96.09ms | 1.1427s | 81.10ms (fail) | 784.92ms |
| kairo unstable | 44.04ms | 77.81ms | 68.28ms | 348.47ms | 335.40ms (fail) | 353.19ms |
| molBench | 492.05ms | 487.30ms | 490.19ms | 1.7213s | 886μs | 594.81ms |
| create_signals | 22.60ms | 29.03ms | 4.56ms | 73.85ms | 65.18ms | 65.55ms |
| comp_0to1 | 4.56ms | 14.93ms | 16.31ms | 30.89ms | 56.70ms | 19.78ms |
| comp_1to1 | 18.20ms | 18.53ms | 24.86ms | 38.10ms | 55.10ms | 36.14ms |
| comp_2to1 | 11.29ms | 17.62ms | 2.25ms | 15.55ms | 35.11ms | 25.39ms |
| comp_4to1 | 1.53ms | 1.99ms | 11.26ms | 30.78ms | 18.06ms | 12.69ms |
| comp_1000to1 | 6μs | 5μs | 4μs | 1.97ms | 51μs | 18μs |
| comp_1to2 | 9.37ms | 20.66ms | 7.49ms | 37.15ms | 48.78ms | 30.93ms |
| comp_1to4 | 14.23ms | 9.70ms | 32.16ms | 31.55ms | 45.83ms | 30.00ms |
| comp_1to8 | 7.25ms | 13.70ms | 7.51ms | 22.75ms | 46.09ms | 20.14ms |
| comp_1to1000 | 6.51ms | 6.05ms | 5.36ms | 18.18ms | 42.80ms | 15.98ms |
| update_1to1 | 3.84ms | 9.48ms | 8.85ms | 43.70ms | 9.41ms | 22.57ms |
| update_2to1 | 5.21ms | 4.71ms | 4.40ms | 21.69ms | 2.89ms | 10.71ms |
| update_4to1 | 1.59ms | 2.37ms | 2.21ms | 10.81ms | 2.24ms | 6.28ms |
| update_1000to1 | 9μs | 23μs | 22μs | 119μs | 15μs | 68μs |
| update_1to2 | 1.92ms | 4.74ms | 4.35ms | 21.68ms | 3.86ms | 11.12ms |
| update_1to4 | 1.02ms | 2.36ms | 2.21ms | 10.80ms | 1.45ms | 6.12ms |
| update_1to1000 | 50μs | 45μs | 57μs | 211μs | 437μs | 159μs |
| cellx1000 | 8.29ms | 10.71ms | 9.26ms | 160.69ms | 6.31ms | 74.42ms |
| cellx2500 | 23.51ms | 37.53ms | 26.39ms | 497.23ms | 24.02ms | 290.07ms |
| cellx5000 | 58.30ms | 67.59ms | 78.09ms | 1.1096s | 67.48ms | 549.30ms |
| 10x5 - 2 sources - read 20.0% (simple) | 262.14ms | 513.94ms | 397.45ms | 2.6399s (half) | 258.20ms | 1.9997s |
| 10x10 - 6 sources - dynamic - read 20.0% (dynamic) | 216.43ms | 279.42ms | 254.77ms | 2.4051s (half) | 204.27ms | 1.5122s |
| 1000x12 - 4 sources - dynamic (large) | 284.77ms | 3.5494s | 2.8390s | 4.0036s (half) | 358.46ms | 1.8568s |
| 1000x5 - 25 sources (wide dense) | 450.32ms | 3.4322s | 2.4469s | 5.0146s (half) | 503.03ms | 3.5254s |
| 5x500 - 3 sources (deep) | 226.15ms | 225.33ms | 206.99ms | 2.0008s (half) | 236.10ms | 1.1447s |
| 100x15 - 6 sources - dynamic (very dynamic) | 261.25ms | 482.94ms | 429.13ms | 2.7717s (half) | 269.87ms | 1.7091s |
<!-- Benchmark Table End -->

> [!TIP]
> - `(fail)`: Test case failed
> - `(half)`: Half of the test cases failed
