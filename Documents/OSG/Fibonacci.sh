#!/bin/bash

fibonacci() {
  n=$1
  if [ "$n" -le 0 ]; then
    echo 0
  elif [ "$n" -eq 1 ]; then
    echo 1
  else
    a=0
    b=1
    for (( i=2; i<=n; i++ )); do
      next=$((a + b))
      a=$b
      b=$next
    done
    echo $b
  fi
}

echo "Enter the number of terms for Fibonacci sequence:"
read n

# Validate input
if ! [[ "$n" =~ ^[0-9]+$ ]] || [ "$n" -le 0 ]; then
  echo "Please enter a positive integer."
  exit 1
fi

sum=0
echo "Fibonacci sequence up to $n terms:"
for (( i=0; i<n; i++ )); do
  val=$(fibonacci $i)
  echo -n "$val "
  sum=$((sum + val))
done
echo
echo "sum = $sum"
