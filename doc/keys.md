

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

## TODO
* 支持钱包文件(.json)形式的导入导出、加密解密