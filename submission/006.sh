# Which tx in block 257,343 spends the coinbase output of block 256,128?

block_256=$(bitcoin-cli getblockhash 256128)
coinbase=$(bitcoin-cli getblock $block_256 | jq -r '.tx[0]')
block_257=$(bitcoin-cli getblockhash 257343)

bitcoin-cli getblock $block_257 | jq -r '.tx[]' | while read TXID; do
    if bitcoin-cli getrawtransaction $TXID true | jq -e ".vin[] | select(.txid == \"$coinbase\")" > /dev/null; then
        echo "$TXID"
        break
    fi
done
