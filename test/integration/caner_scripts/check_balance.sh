#!/bin/bash

echo "check balance of ${1}"
sifnoded q bank balances $(sifnoded keys show $1 --keyring-backend test -a) --node tcp://rpc-devnet-042.sifchain.finance:80 --chain-id=sifchain-devnet-042