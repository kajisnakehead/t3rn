#!/bin/bash

# Set environment variables
export PROMETHEUS_PORT=9092
export NODE_ENV=testnet
export LOG_LEVEL=debug
export LOG_PRETTY=false
export PRIVATE_KEY_LOCAL=bbad0cc85bab9f728ae7ed4086402246ba4fb1cbd2901e862c7f9d9ee14d8a56
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,blast-sepolia,optimism-sepolia,l1rn'
export EXECUTOR_MAX_L3_GAS_PRICE=1000
export EXECUTOR_PROCESS_ORDERS=false
export EXECUTOR_PROCESS_CLAIMS=true
#export RPC_ENDPOINTS_L1RN='https://brn.calderarpc.com/'
export RPC_ENDPOINTS_L1RN='https://brn.rpc.caldera.xyz/'
export RPC_ENDPOINTS_OPSP='https://opt-sepolia.g.alchemy.com/v2/CPvsflMAvr6CCXjOOZ1gVeZz0vc6-jo4'
export RPC_ENDPOINTS_BSSP='https://base-sepolia.g.alchemy.com/v2/CPvsflMAvr6CCXjOOZ1gVeZz0vc6-jo4'
export RPC_ENDPOINTS_ARBT='https://arb-sepolia.g.alchemy.com/v2/CPvsflMAvr6CCXjOOZ1gVeZz0vc6-jo4'
export RPC_ENDPOINTS_BLSS='https://blast-sepolia.g.alchemy.com/v2/CPvsflMAvr6CCXjOOZ1gVeZz0vc6-jo4'
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
