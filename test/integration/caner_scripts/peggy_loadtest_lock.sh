#!/bin/bash

# check balance of peggy-loadtest-lock
# balances:
# - amount: "10000000000"
#   denom: rowan
# pagination:
#   next_key: null
#   total: "0"

# 1) starts with ETH account with 50 ETH
# 2) x1000 lock a tiny 1 cETH amount
# 3) expected to see a 1000 cETH amount in lock account

# lets lock ETH first (import)
SIFCHAIN_LOCK_ADDRESS=$(sifnoded keys show peggy-loadtest-lock --keyring-backend test -a)
for i in {1..1000}
do
    yarn -s --cwd /sifnode/smart-contracts integrationtest:sendLockTx --sifchain_address ${SIFCHAIN_LOCK_ADDRESS} --symbol eth --ethereum_private_key_env_var ETHEREUM_PRIVATE_KEY --json_path /sifnode/smart-contracts/deployments/sifchain-devnet-042 --gas estimate --ethereum_network ropsten --bridgebank_address 0x471e0ffB16C4eEde754cEfD7F522257df37a1410 --ethereum_address 0x5171050beb52148aB834Fb21E3E30FA429470c46 --amount 1
done