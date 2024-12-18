import 'dart:math';

import '../framework_type.dart';
import '../reactive_framework.dart';

class Graph {
  const Graph({
    required this.sources,
    required this.layers,
  });

  final Iterable<Signal<int>> sources;
  final Iterable<Iterable<Computed<int>>> layers;
}

class Counter {
  int count = 0;
}

Graph makeGraph(
  ReactiveFramework framework,
  TestConfig config,
  Counter counter,
) {
  final TestConfig(:width, :totalLayers, :staticFraction, :nSources) = config;

  return framework.withBuild(() {
    final sources = List.generate(width, (i) => framework.signal(i));
    final rows = _makeDependentRows(
        sources, totalLayers - 1, counter, staticFraction, nSources, framework);

    return Graph(
      sources: sources,
      layers: rows,
    );
  });
}

int runGraph(Graph graph, int iterations, double readFraction,
    ReactiveFramework framework) {
  final random = Random(0);
  final Graph(:sources, :layers) = graph;
  final leaves = layers.last;
  final skipCount = leaves.length * (1 - readFraction).round();
  final readLeaves = _removeElems(leaves, skipCount, random);

  late int sum;
  framework.withBatch(() {
    for (int i = 0; i < iterations; i++) {
      final sourceDex = i % sources.length;
      sources.elementAt(sourceDex).write(i + sourceDex);

      for (final leaf in readLeaves) {
        leaf.read();
      }
    }

    sum = readLeaves.fold(0, (total, leaf) => total + leaf.read());
  });

  return sum;
}

Iterable<T> _removeElems<T>(Iterable<T> src, int rmCount, Random random) {
  final result = <T>[...src];
  for (int i = 0; i < rmCount; i++) {
    final rmDex = random.nextInt(result.length - 1);
    result.removeAt(rmDex);
  }

  return result;
}

Iterable<Iterable<Computed<int>>> _makeDependentRows(
  Iterable<ISignal<int>> sources,
  int numRows,
  Counter counter,
  double staticFraction,
  int nSources,
  ReactiveFramework framework,
) sync* {
  Iterable<ISignal<int>> prevRow = sources;
  final random = Random(0);

  for (int i = 0; i < numRows; i++) {
    yield prevRow = _makeRow(
        prevRow, counter, staticFraction, nSources, framework, i, random);
  }
}

Iterable<Computed<int>> _makeRow(
    Iterable<ISignal<int>> sources,
    Counter counter,
    double staticFraction,
    int nSources,
    ReactiveFramework framework,
    int layer,
    Random random) {
  return Iterable.generate(sources.length, (dex) {
    final innerSources = <ISignal<int>>[];
    for (int i = 0; i < nSources; i++) {
      innerSources.add(sources.elementAt(
        (i + dex) % sources.length,
      ));
    }

    final staticNode = random.nextDouble() < staticFraction;
    if (staticNode) {
      return framework.computed(() {
        counter.count++;

        int sum = 0;
        for (final src in innerSources) {
          sum += src.read();
        }

        return sum;
      });
    }

    final [first, ...tail] = innerSources;
    return framework.computed(() {
      counter.count++;
      int sum = first.read();
      final shouldDrop = sum & 0x1;
      final dropDex = sum % tail.length;

      for (final (i, s) in tail.indexed) {
        if (shouldDrop != 0 && i == dropDex) {
          continue;
        }
        sum += s.read();
      }

      return sum;
    });
  });
}
