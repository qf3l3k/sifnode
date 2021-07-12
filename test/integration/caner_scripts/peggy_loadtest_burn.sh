#!/bin/bash

# check balance of peggy-loadtest-burn
# balances:
# - amount: "10000000000"
#   denom: rowan
# pagination:
#   next_key: null
#   total: "0"

# 1) starts with pegged account with 11 cETH (10 cETH to cover 1000x 0.01 cETH fee + 1 cETH to cover 100 cETH amount)
# yarn -s --cwd /sifnode/smart-contracts integrationtest:sendLockTx --sifchain_address $(sifnoded keys show peggy-loadtest-burn --keyring-backend test -a) --symbol eth --ethereum_private_key_env_var ETHEREUM_PRIVATE_KEY --json_path /sifnode/smart-contracts/deployments/sifchain-devnet-042 --gas estimate --ethereum_network ropsten --bridgebank_address 0x471e0ffB16C4eEde754cEfD7F522257df37a1410 --ethereum_address 0x5171050beb52148aB834Fb21E3E30FA429470c46 --amount 11000000000000000000
# 2) x1000 burn cETH with a tiny amount 100 and huge fees 0.01ETH and 100k rowan fees
# 3) expected to see tiny changes in ETH account balance

# then burn cETH (export)
SIFCHAIN_BURN_ADDRESS=$(sifnoded keys show peggy-loadtest-burn --keyring-backend test -a)
for i in {1..150}
do
    sifnoded tx ethbridge burn ${SIFCHAIN_BURN_ADDRESS} 0x5171050beb52148aB834Fb21E3E30FA429470c46 100 ceth 70000000000000000 --node tcp://rpc-devnet-042.sifchain.finance:80 --keyring-backend test --fees 100000rowan --ethereum-chain-id=3 --chain-id=sifchain-devnet-042 --yes --from ${SIFCHAIN_BURN_ADDRESS}
done