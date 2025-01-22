#!/bin/bash

# Set environment variables
export PROMETHEUS_PORT=9091
export NODE_ENV=testnet
export LOG_LEVEL=debug
export LOG_PRETTY=false
export PRIVATE_KEY_LOCAL=4190e58bda1f03c68c97fe8dc51490d30977b784abade7ebe9c3bc177a27b801
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,blast-sepolia,optimism-sepolia,l1rn'
export EXECUTOR_MAX_L3_GAS_PRICE=1000
export EXECUTOR_PROCESS_ORDERS=true
export EXECUTOR_PROCESS_CLAIMS=true
#export RPC_ENDPOINTS_L1RN='https://brn.calderarpc.com/'
export RPC_ENDPOINTS_L1RN='https://brn.rpc.caldera.xyz/'
export RPC_ENDPOINTS_OPSP='https://opt-sepolia.g.alchemy.com/v2/63ZnG5n24PKKRD1HtD-k1t6iifWP-Xa2'
export RPC_ENDPOINTS_BSSP='https://base-sepolia.g.alchemy.com/v2/63ZnG5n24PKKRD1HtD-k1t6iifWP-Xa2'
export RPC_ENDPOINTS_ARBT='https://arb-sepolia.g.alchemy.com/v2/63ZnG5n24PKKRD1HtD-k1t6iifWP-Xa2'
export RPC_ENDPOINTS_BLSS='https://blast-sepolia.g.alchemy.com/v2/63ZnG5n24PKKRD1HtD-k1t6iifWP-Xa2'

export EXECUTOR_PROCESS_PENDING_ORDERS_FROM_API=false
export EXECUTOR_PROCESS_ORDERS_API_ENABLED=false


handle_exit() {
  echo "Executor process stopped unexpectedly. Restarting..."
  sleep 5  # Optional delay before restarting
  run_executor
}

# Function to run the executor
run_executor() {
  echo "Starting executor..."
  ./executor
}

# Set trap to handle termination signals (e.g., process exit or failure)
trap handle_exit EXIT

# Start the executor for the first time
run_executor
