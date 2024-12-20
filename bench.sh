#!/bin/bash

while IFS= read -r -d $'\0' framework_file; do
  framework=$(basename "$framework_file" .dart)
  frameworks+=("$framework")
done < <(find ./bin -maxdepth 1 -type f -name "*.dart" -print0)

if [ ${#frameworks[@]} -eq 0 ]; then
  echo "Error: No Dart files found in ./bin directory."
  exit 1
fi

for framework in "${frameworks[@]}"
do
  echo "==================== $framework ===================="
  echo "$(date)"
  echo "Running benchmark for $framework..."

  # compile to native
  echo "Compiling $framework to native..."
  dart compile exe "bin/$framework.dart" -o "bin/$framework" || exit 1

  { ./bin/$framework | tee  bench/$framework.md; } 2>&1;
  rm "bin/$framework"
  if [ $? -ne 0 ]; then
    echo "Error running benchmark for $framework"
    exit 1
  fi
done
