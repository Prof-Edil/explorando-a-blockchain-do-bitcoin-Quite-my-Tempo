# Only one single output remains unspent from block 123,321. What address was it sent to?
block_hash=$(bitcoin-cli getblockhash 123321)
block=$(bitcoin-cli getblock $block_hash | jq -r '.tx[]')

for txid in $block; do
  tx=$(bitcoin-cli getrawtransaction $txid true)
  vouts=$(echo "$tx" | jq '.vout | length')

  for ((i=0; i<$vouts; i++)); do
    address=$(bitcoin-cli gettxout $txid $i)

    if [[ ! -z "$address" ]]; then
      echo $address | jq -r '.scriptPubKey.address'
      exit 0
    fi
  done
done


