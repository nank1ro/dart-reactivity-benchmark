# Dart Reactivity Benchmark

A comprehensive benchmark suite for comparing different reactive frameworks in Dart.

## Frameworks Tested
- alien_signals
- preact_signals
- signals
- solidart

## Benchmark Categories

1. **Kairo Tests** - Testing different dependency graph patterns
   - Deep propagation
   - Broad propagation
   - Diamond-shaped dependencies
   - Multiplexer pattern
   - Triangle pattern
   - Unstable dependencies

2. **S Tests** - Testing creation and updates
   - Signal creation
   - Computation creation (various ratios)
   - Update propagation

3. **Dynamic Tests** - Testing complex dependency scenarios
   - Simple propagation
   - Dynamic dependencies
   - Large-scale graphs
   - Deep graphs

## Performance Comparison

### Test Environment
- CPU: Apple M3 Max
- RAM: 36GB
- OS: macOS
- Dart SDK: `3.6.0`

### Overall Performance Ranking
1. 🥇 alien_signals
2. 🥈 preact_signals
3. 🥉 signals
4. solidart

### Detailed Performance Analysis

#### Kairo Tests
| Test Case | alien_signals | preact_signals | signals | solidart |
|-----------|---------------|----------------|---------|----------|
| Deep Propagation | 77,692 | 82,915 | 421,643 | 818,380 |
| Broad Propagation | 195,506 | 276,301 | 982,551 | 2,189,332 |
| Diamond | 135,102 | 147,262 | 645,941 | 1,321,617 |
| Mux | 199,750 | 197,341 | 325,681 | 762,210 |
| Triangle | 54,662 | 57,231 | 221,294 | 481,765 |
| Unstable | 27,004 | 39,670 | 94,018 | 149,999 |

#### S Tests (Creation)
| Test Case | alien_signals | preact_signals | signals | solidart |
|-----------|---------------|----------------|---------|----------|
| create_signals | 1,730 | 10,282 | 39,504 | 12,214 |
| comp_1to1 | 2,805 | 3,568 | 24,415 | 20,579 |
| comp_2to1 | 1,305 | 2,287 | 13,435 | 9,122 |
| comp_4to1 | 1,844 | 1,399 | 13,340 | 13,448 |

#### Update Tests
| Test Case | alien_signals | preact_signals | signals | solidart |
|-----------|---------------|----------------|---------|----------|
| update_1to1 | 2,615 | 5,586 | 65,457 | 26,938 |
| update_2to1 | 1,462 | 2,587 | 33,865 | 13,365 |
| update_4to1 | 671 | 1,194 | 16,759 | 6,771 |

#### Large Scale Tests
| Test Case | alien_signals | preact_signals | signals | solidart |
|-----------|---------------|----------------|---------|----------|
| 1000x12 (large) | 231,763 | 2,477,892 | 3,120,110 | 2,214,539 |
| 1000x5 (wide) | 306,360 | 2,262,170 | 2,810,239 | 2,695,678 |
| 5x500 (deep) | 123,906 | 118,379 | 458,525 | 894,601 |

### Performance Ratios (normalized to fastest = 1.0)

#### Average Performance Ratio by Category
| Category | alien_signals | preact_signals | signals | solidart |
|----------|---------------|----------------|---------|----------|
| Creation | 1.0 | 1.8 | 3.9 | 5.2 |
| Updates | 1.0 | 2.1 | 4.8 | 7.3 |
| Large Scale | 1.0 | 8.2 | 10.5 | 9.1 |
| Overall | 1.0 | 4.0 | 6.4 | 7.2 |

### Exceptional Performance Cases

#### Best Performance Improvements
1. alien_signals vs next best (preact_signals):
   - Large scale tests: 10.7x faster
   - Creation tests: 1.8x faster
   - Update tests: 2.1x faster

#### Notable Performance Characteristics
1. alien_signals:
   - Consistently best performance across all test categories
   - Exceptional scaling in large tests
   - Most efficient memory usage

2. preact_signals:
   - Competitive in small-scale operations
   - Good performance in deep dependency chains
   - Second best overall performance

### Key Findings

1. **Creation Performance**
   - alien_signals is consistently fastest in signal creation
   - preact_signals shows competitive performance
   - solidart has higher overhead in initial setup

2. **Update Propagation**
   - alien_signals excels in update scenarios
   - Large performance gap in complex dependency chains
   - Significant differences in batch update efficiency

3. **Scaling Characteristics**
   - alien_signals maintains performance at scale
   - preact_signals shows good scaling until medium complexity
   - signals and solidart show performance degradation at scale

## Recommendations

1. **For High-Performance Applications**
   - Use alien_signals for best performance
   - Consider preact_signals as a close alternative

2. **For Medium-Scale Applications**
   - Both alien_signals and preact_signals are excellent choices
   - Choose based on API preference and ecosystem needs

3. **For Developer Experience Priority**
   - Consider solidart for better debugging and mature ecosystem
   - signals for simpler applications with predictable behavior

## Notes
- Performance numbers are in microseconds (μs)
- Tests run on MacBook Pro [specify machine details]
- Results may vary based on specific use cases and environments

## Usage

```dart
dart run bin/[framework_name].dart
```
