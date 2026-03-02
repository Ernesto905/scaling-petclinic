#!/usr/bin/bash

set -euo pipefail

mapfile -t FILES < <(ls k6-*.yml 2>/dev/null || true)
if [ ${#FILES[@]} -eq 0 ]; then
  echo "No k6-*.yml files found in current directory."
  exit 1
fi

echo "Select a k6 script to run:"
select FILE in "${FILES[@]}"; do
  if [[ -n "${FILE:-}" ]]; then
    break
  else
    echo "Invalid selection. Try again."
  fi
done

echo "Applying ${FILE}..."
minikube kubectl -- apply -f "$FILE"

echo "Waiting for job to be ready..."
minikube kubectl -- wait --for=condition=complete job/k6 --timeout=-1s

echo "Following logs:"
echo "----------------------------------------"

minikube kubectl -- logs -f "jobs/k6" || true

echo
echo "Finished! Cleaning up resources..."

minikube kubectl -- delete -f "$FILE"

echo "Cleanup complete."
