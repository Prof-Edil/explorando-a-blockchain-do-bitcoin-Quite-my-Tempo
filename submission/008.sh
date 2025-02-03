# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

input=$(bitcoin-cli getrawtransaction "e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163" true| jq -r '.vin[0].txinwitness[2]')
echo ${input:4:66} #OP_PUSHBYTES_33