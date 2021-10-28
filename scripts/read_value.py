#SPDX-License-Identifier: <SPDX-License>
from brownie import X,accounts,config 

def read_contract():
    x_contract = X[-1]
    account = accounts.add(config['wallets']['from_key'])
    
    print(x_contract.createCharacter("sa",{'from':account}))
    print(x_contract.viewChar(2))
    
def main():
    read_contract()
