# How many new outputs were created by block 123,456?
block=$(bitcoin-cli getblockhash 123456)
total_out=$(bitcoin-cli getblock $block 2 | jq '[.tx[].vout | length] | add')
echo $total_out
