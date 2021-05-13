

## Useage

### keys创建:
创建一组新的public/private key并得到 bech32 地址

```
key = Platon::Key.new
key.private_hex ## 私钥
key.public_hex ## 公钥
key.bech32_address(hrp: "lat") ## bech32 格式公钥 ,默认是 "atp"
```

使用已有私钥导入

```
key = Platon::Key.new priv: private_key
```


备份钱包，输入密码加密得到json字符串

```
encrypted_key_info = Platon::Key.encrypt key,"your_password"

or

Platon::Key.encrypt_and_save key,"your_password",'./some/path.json'

or 使用默认地址:  ~/.platon/keystore

Platon::Key.encrypt_and_save key,"your_password" 

```

恢复钱包，输入密码得到key对象

```
decrypted_key = Platon::Key.decrypt encrypted_key_info,"your_password"

or

decrypted_key = Platon::Key.decrypt File.read('./some/path.json'), 'your_password'
```

查询本地钱包
```
Platon::Key.list_wallets

or

Platon::Key.list_wallets("/your/wallet/path/")
```


可以使用如下方式转账:

```
$client.transfer $key,"atpxxxxxxxxxxxxxxx",10**16
```
注: 



## Rake 任务Utils
提供了一些 rake 任务可以作为辅助工具，如：

```
rake 'platon:contract:compile[path]'            # Compile a contract
rake 'platon:contract:deploy[path]'             # Compile and deploy contract
rake 'platon:transaction:byhash[id]'            # Get info about transaction
rake 'platon:transaction:send[address,amount]'  # Send [amount of] ATP to an account
```

举例如下：
```
rake 'platon:contract:compile[./spec/fixtures/greeter.sol]'
```
