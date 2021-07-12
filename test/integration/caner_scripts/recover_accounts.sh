#!/bin/bash

# recover rowansource
sifnoded keys delete rowansource --keyring-backend test -y 2> /dev/null
printf "%s\n\n" "aaaaaaaa" | sifnoded keys import rowansource sandpitkey.txt --keyring-backend test

# recover source2
sifnoded keys delete source2 --keyring-backend test -y 2> /dev/null
printf "%s\n\n" "announce world annual mushroom student eight observe panda life record radar someone amazing candy giggle time floor bottom rent expose neglect liberty violin smooth"  | sifnoded keys add source2 -i --recover --keyring-backend test

# recover imsource
sifnoded keys delete imsource --keyring-backend test -y 2> /dev/null
printf "%s\n\n" "connect rocket hat athlete kind fall auction measure wage father bridge tackle midnight athlete benefit faculty shove okay win entire reveal kit era truly" | sifnoded keys add imsource -i --recover --keyring-backend test

# testaccount
sifnoded keys delete testaccount --keyring-backend test -y 2> /dev/null
printf "%s\n\n" "donate select identify pause flat extend already broccoli organ key fantasy snack truth auto galaxy side blind pistol unusual brush suit draft cheap gorilla" | sifnoded keys add testaccount -i --recover --keyring-backend test

# peggy-loadtest-lock
sifnoded keys delete peggy-loadtest-lock --keyring-backend test -y 2> /dev/null
printf "%s\n\n" "abstract stereo bread enforce coach anchor length artist absorb aerobic bird result safe artist olympic fog pear cousin grocery satoshi gallery day remember argue" | sifnoded keys add peggy-loadtest-lock -i --recover --keyring-backend test

# peggy-loadtest-burn
sifnoded keys delete peggy-loadtest-burn --keyring-backend test -y 2> /dev/null
printf "%s\n\n" "heavy fence master quality double elephant inch plate friend demand protect cruel jelly limb tail fox all truck nominee tube leisure glad choose blue" | sifnoded keys add peggy-loadtest-burn -i --recover --keyring-backend test