# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
txinwitness=()
for i in {0..3}
do
    pubkey=$(bitcoin-cli getrawtransaction "37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517" true | jq -r --arg i "$i" '.vin[$i|tonumber].txinwitness[1]')
    txinwitness+=($pubkey)
done

echo $(bitcoin-cli createmultisig 1 "[\"${txinwitness[0]}\", \"${txinwitness[1]}\", \"${txinwitness[2]}\", \"${txinwitness[3]}\"]" | jq -r ".address")
