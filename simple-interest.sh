#!/usr/bin/env bash
set -euo pipefail

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time period (years): " time

for value in "$principal" "$rate" "$time"; do
  if [[ ! "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: enter non-negative numbers only." >&2
    exit 1
  fi
done

LC_ALL=C awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {
  interest = p * r * t / 100
  printf "Simple interest: %.2f\n", interest
  printf "Total amount: %.2f\n", p + interest
}'
