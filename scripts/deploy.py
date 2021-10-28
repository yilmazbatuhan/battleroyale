#SPDX-License-Identifier: <SPDX-License>
from brownie import accounts,config,X,network
from dotenv import load_dotenv
from scripts.helpful_scripts import get_account

load_dotenv()

def deploy_x():
    print("x")  
    account = get_account()
    x_contract =X.deploy({'from':account}) #contract adresi döndürür
    #price feed addres = config['networks]['rinkeby'][network.show_active()]["eth_usd_price_feed"00]
    transaction = x_contract.createCharacter("gurkan",{'from':account})
    print(f"contract deployed to : {x_contract.address}")
    transaction.wait(1)
    viewChar = x_contract.viewChar(0)
    print(viewChar)

def main(): 
    deploy_x()