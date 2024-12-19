#!/bin/bash
set -e

get_system_info() {
  echo "System Information:"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "  Operating System: $(sw_vers -productName) $(sw_vers -productVersion) $(sw_vers -buildVersion)"
    echo "  Model: $(sysctl -n hw.model)"
    memsize_bytes=$(sysctl -n hw.memsize)
    memsize_gb=$(echo "scale=2; $memsize_bytes / (1024 * 1024 * 1024)" | bc)
    echo "  Memory: ${memsize_gb} GB"
    echo "  CPU: $(sysctl -n machdep.cpu.brand_string)"
  elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "  Operating System: $(uname -o) $(uname -r)"
    echo "  CPU: $(lscpu | grep "Model name:" | awk '{print $3,$4,$5,$6,$7}')"
    meminfo=$(cat /proc/meminfo | grep "MemTotal:")
    memsize_kb=$(echo "$meminfo" | awk '{print $2}')
    memsize_gb=$(echo "scale=2; $memsize_kb / (1024 * 1024)" | bc)
    echo "  Memory: ${memsize_gb} GB"
    dmidecode -t system | grep "Product Name" | awk -F: '{print $2}' | sed 's/^ *//'
  elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
      echo "  Operating System: $(wmic os get Caption /value | grep Caption | cut -d'=' -f2)"
      echo "  CPU: $(wmic cpu get Name /value | grep Name | cut -d'=' -f2)"
      memsize_bytes=$(wmic computersystem get TotalPhysicalMemory /value | grep TotalPhysicalMemory | cut -d'=' -f2)
      memsize_gb=$(echo "scale=2; $memsize_bytes / (1024 * 1024 * 1024)" | bc)
      echo "  Memory: ${memsize_gb} GB"
      echo "  Model: $(wmic csproduct get Name /value | grep Name | cut -d'=' -f2)"
  else
    echo "  Unknown operating system."
  fi
}

while IFS= read -r -d $'\0' framework_file; do
  framework=$(basename "$framework_file" .dart)
  frameworks+=("$framework")
done < <(find ./bin -maxdepth 1 -type f -name "*.dart" -print0)


if [ ${#frameworks[@]} -eq 0 ]; then
  echo "Error: No Dart files found in ./bin directory."
  exit 1
fi

dart pub get || exit 1
get_system_info | tee bench.log

for framework in "${frameworks[@]}"
do
  echo "==================== $framework ===================="
  echo "$(date)"
  echo "Running benchmark for $framework..."
  echo "" >> bench.log
  echo "==================== $framework ====================" >> bench.log
  echo "$(date)" >> bench.log

  # compile to native
  echo "Compiling $framework to native..."
  dart compile exe "bin/$framework.dart" -o "bin/$framework" --enable-asserts || exit 1

  { time "bin/$framework"; } 2>&1 | tee -a bench.log
  if [ $? -ne 0 ]; then
    echo "Error running benchmark for $framework"
    echo "Error running benchmark for $framework" >> bench.log
    exit 1
  fi
  rm "bin/$framework"

  elapsed_real=$(grep "real" bench.log | tail -n 1 | awk '{print $2}')
  elapsed_user=$(grep "user" bench.log | tail -n 1 | awk '{print $2}')
  elapsed_sys=$(grep "sys" bench.log | tail -n 1 | awk '{print $2}')

  echo "Benchmark for $framework took:"
  echo "  Real: $elapsed_real"
  echo "  User: $elapsed_user"
  echo "  System: $elapsed_sys"
  echo "Benchmark for $framework took:" >> bench.log
  echo "  Real: $elapsed_real" >> bench.log
  echo "  User: $elapsed_user" >> bench.log
  echo "  System: $elapsed_sys" >> bench.log
  echo ""
done

echo "Benchmarks complete. Results in bench.log"
