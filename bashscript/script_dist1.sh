#!/bin/bash
# assume root

touch /root/mark727start
rm -rf "/root/output1"
exec > "/root/output1"
apt-get install -y git
cd /root/
git clone http://github.com/ethereum/go-ethereum
sudo apt-get install -y build-essential
sudo apt-get install -y curl
if ! type "$go" > /dev/null; then
 	curl -O https://dl.google.com/go/go1.9.7.linux-amd64.tar.gz
	tar -xzf go1.9.7.linux-amd64.tar.gz
	rm -rf /usr/local/go 
	mv go /usr/local
fi
if ! type "$geth" > /dev/null; then
	touch tmprof
	echo 'GOPATH=/usr/local/go/bin'>>tmprof
	echo "PATH=\"\$PATH:\$GOPATH\"">>tmprof
	source tmprof
	rm -rf tmprof
	# line : return CalcDifficulty(chain.Config(), time, parent)
	# to : return big.NewInt(1).
	# cd /root/go-ethereum/consensus/ethash/
	# sed -i 's:return CalcDifficulty(chain.Config(), time, parent):return big.NewInt(1):g' consensus.go
	cd /root/go-ethereum/
	make geth
	mv /root/go-ethereum/build/bin/geth /usr/bin/ 
fi

geth --datadir /root/privnet init genesis.json
rm -rf "/root/mark727start"
touch "/root/mark727end"