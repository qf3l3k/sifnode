#!/bin/bash

for i in {1..1000}
do
    sifnoded tx ibc-transfer transfer transfer channel-2 cosmos1py6ky4rrlnv77ertea6vg6mt6wq9gy9f6dlgq5 1rowan --from testaccount --keyring-backend test --node tcp://rpc-devnet-042.sifchain.finance:80 --chain-id=sifchain-devnet-042 --fees 100000rowan -y --packet-timeout-timestamp 0
done

for i in {1..1000}
do
    gaiad tx ibc-transfer transfer transfer channel-21 sif1q4e8h7sw9ngvake3en69qt8yee4l8fgdt47hr9 1stake --from cosmosnode --keyring-backend test --chain-id cosmoshub-testnet --node http://a941f6afd0d994a57979ffbaf284d2c0-95f50faefa055d52.elb.us-west-2.amazonaws.com:26657 -y --packet-timeout-timestamp 0
done