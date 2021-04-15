## 基础RPC接口
基础API包括网络、交易、查询、节点信息、经济模型参数配置等相关的接口，具体说明如下。

### web3_client_version
返回当前客户端版本

* 参数:
    
    无
* 返回值
    `String`: 当前版本号
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.web3_client_version
=> "PlatONnetwork/alaya-node/v0.15.0-unstable-9867ee68/linux-amd64/go1.13.4"
```

### web3_sha3
返回给定数据的keccak-256（并非标准sha3-256）

* 参数
    
    `String`:待转换的哈希值
* 返回值
    `String`:sha3计算结果
    
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.web3_sha3("0x68656c6c6f20776f726c64")
=> "0x47173285a8d7341e5e972fc677286384f802f8ef42a5ec5f03bbfa254cb01fad"
```

### net_listening
如果客户端正活跃监听网络链接，则返回true

* 参数
    无
* 返回值
    `Boolean`: 正在监听返回true,否则返回false
* 示例


```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.net_listening
=> true
```

### net_peer_count
查看当前客户端所连接的节点数

* 参数
    无
* 返回值
    `Integer`: 返回当前客户端链接的节点数
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.net_peer_count
 => 24
```

### platon_protocol_version
查询

* 参数
    无
* 返回值
    `Integer`: 返回当前Platon协议版本
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_protocol_version
 => 63
```

### platon_syncing
查询当前节点的同步状态

* 参数
    无
* 返回值
    `Object | Boolean`: 返回当前同步的状态，或返回 `false`，当没在同步时:
    `startingBlock`:`QUANTITY` - 起始区块
    `currentBlock` :`QUANTITI` - 当前区块，与 platon_block_number 相同
    `highestBlock` :`QUANTITY` - 估计最高的区块
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_syncing
### syncing
=>{
    startingBlock: '0x384',
    currentBlock: '0x386',
    highestBlock: '0x454'
  }
### or when not syncing 
=> false
```

### platon_gas_price
返回当前gas价格
* 参数
    无
* 返回值
    ```Integer```: 当前gas价格，单位为von
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_gas_price
=> 1000000000
```

### platon_accounts
返回客户端拥有的platon账户

* 参数
    无
* 返回值
    `Array`: 客户端拥有的platon账户
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_accounts
=>[]
```

### platon_block_number
返回区块链上最新区块

* 参数
    无
* 返回值
    `Integer`: 客户端中监听到的链上最新区块
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_block_number
=> => 10513205
```

### platon_get_balance

查询账户余额

* 参数
    * `String` 待查询地址,bech32
    * `Integer | String` :可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值
    * `Integer`: 账户余额（von）
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_balance("atp12kwg77yu4aqf0xmjgdysrkjzqnapt3wasvnpne","latest")
=> 28907596000000000

client.platon_get_balance("atp12kwg77yu4aqf0xmjgdysrkjzqnapt3wasvnpne", 10713205)
=> 28907596000000000
```

### platon_get_storage_at
* 参数
    * `String` 待查询地址，bech32
    * `String` hex string ,存储的位置
    * `String` "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)
* 返回值
    * `String` 该存储位置的值
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_storage_at("atp12kwg77yu4aqf0xmjgdysrkjzqnapt3wasvnpne","0x2","latest")
=> "0x"
```

### platon_get_transaction_count
返回地址发起的交易数量

* 参数
 
    * `String` 待查询地址,bech32 address
    * `Integer | String` :可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值
    * `Integer`: 返回该地址发起的交易数量
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_transaction_count("atp12kwg77yu4aqf0xmjgdysrkjzqnapt3wasvnpne","latest")
=> 50
```

### platon_get_block_transaction_count_by_hash
根据区块哈希值查询交易数量

* 参数

    * `String` 待查询的区块哈希值
* 返回值

    * `Integer` 返回该区块中交易数
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_block_transaction_count_by_hash("0xd2dede658ef3ec62336b5cd3b6d62997d5a025edb48860c1ec84bd186f8225b8")
=> 1
```


### platon_get_block_transaction_count_by_number
根据区块高度查询交易数量

* 参数

    * `Integer`: 待查询的区块高度
* 返回值
    
    * `Integer`: 返回该区块中的交易数
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_block_transaction_count_by_number(10805358)
=> 1
```

### platon_get_code
返回指定地址的code

* 参数

    * `String`: 待查询的地址 bech32 address
    * `Integer | String` :可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

    `String`: 该地址的code
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_code("atp1cay80hvyqpmt65wsn6nwng048q88jcg2jlf3sv","latest")
=> "0x608060405260...
```

### platon_sign

使用某给定账号对data进行签名,注意：该地址需要提前解锁

* 参数

    * `String`: 指定签名的bench32地址
    * `String`: 待签名的信息，需要为0x开头的hex字符串
* 返回值

    * `String`: 已签名数据
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_sign("atp1zdpu5f55gxurfzgkn8tgc7pwwl34jquf5twpyn","0x1234")
=> "0x1d39459e2050493f89ec0aa09112bce7a08a9774d054fc71159e2435961ef1732862145cd0cedd1859bfd8698044c2a0963262b75aeb187650f4ca4f8b5b754c1b"
```

### platon_send_transaction
发送服务待签名交易

* 参数

    * `Object`: Transaction 交易结构
        * `String`: from ，交易发送地址
        * `String`: to , 交易接收地址
        * `Integer`: gas, 本次交易gas用量上限
        * `Integer`: gasPrice, gas价格
        * `Integer`: value,转账金额
        * `String`: data, 上链数据，合约的已编译代码或调用的方法的签名与编码参数的哈希
        * `Integer`: nonce, 交易nonce值
* 返回值

    `String`: 32Bytes 的已签名字符串 或 如果交易不可用返回zero hash
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_send_transaction({
    "from": "atp1zdpu5f55gxurfzgkn8tgc7pwwl34jquf5twpyn",
    "to": "atp1h5dx7v9qgf40mctz5cm76kl4ap5lmau759ap70",
    "gas": "0x76c0", # 30400,
    "gasPrice": "0x9184e72a000", # 10000000000000
    "value": "0x9184e72a", # 2441406250
    "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
    })
=> "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331"
```

### platon_send_raw_transaction
创建一个新的消息调用交易，或对于已签名交易做合约创建

* 参数

    * `Object`: Transaction 交易结构
    * `String`: data 已签名交易
* 返回值

    * `String`: 32Bytes 的已签名字符串 或 如果交易不可用返回zero hash
```
params: ["0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"]
```
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_send_raw_transaction(["0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"])
```

### platon_call
执行一个消息调用交易，消息调用交易直接在节点旳执行而不需要通过区块链的挖矿来执行

* 参数

    * `Object`: Transaction 交易结构
        * `String`: from ，交易发送地址
        * `String`: to , 交易接收地址
        * `Integer`: gas, 本次交易gas用量上限
        * `Integer`: gasPrice, gas价格
        * `Integer`: value,转账金额
        * `String`: data, 上链数据，合约的已编译代码或调用的方法的签名与编码参数的哈希
        * `Integer | String` :可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

    * 执行合约的返回值
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_call({
    "from": "atp1zdpu5f55gxurfzgkn8tgc7pwwl34jquf5twpyn",
    "to": "atp1h5dx7v9qgf40mctz5cm76kl4ap5lmau759ap70",
    "gas": "0x76c0", # 30400,
    "gasPrice": "0x9184e72a000", # 10000000000000
    "value": "0x9184e72a", # 2441406250
    "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
    },"latest")
=> "0xe670ec64341771606e55d6b4ca35a1a6b75ee3d5145a99d05921026d1527331"
```

### platon_estimate_gas
生成并返回完成交易所需的gas估算值。 交易将不会添加到区块链中。 注:由于各种原因（包括EVM机制和节点性能），估算值可能大大超过交易实际使用的gas

* 参数

    * `Object`: Transaction 交易结构
    * `String`: from ，交易发送地址
    * `String`: to , 交易接收地址
    * `Integer`: gas, 本次交易gas用量上限
    * `Integer`: gasPrice, gas价格
    * `Integer`: value,转账金额
    * `String`: data, 上链数据，合约的已编译代码或调用的方法的签名与编码参数的哈希
    * `Integer | String` :可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

    * `Integer`: 评估的gas使用值
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_estimate_gas({
    "from": "atp1zdpu5f55gxurfzgkn8tgc7pwwl34jquf5twpyn",
    "to": "atp1h5dx7v9qgf40mctz5cm76kl4ap5lmau759ap70",
    "gasPrice": "0x9184e72a000", # 10000000000000
    "value": "0x9184e72a", # 2441406250
    "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
    })
=> 21000
```

### platon_get_block_by_hash
通过交易hash查询block

* 参数

    * `String`: 32Bytes 区块哈希值
    * `Boolean`: true 返回区块全量信息，false 只返回交易的hash值
* 返回值
    * `Object`: 区块的结构，或如果未找到返回 `nil`
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_block_by_hash("0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7",false)
=> {"extraData"=>"0xd9820f0086706c61746f6e88676f312e31332e34856c696e7578000000000000d0ce481ee2aeca0cc474c03882afa2bb25968d025f63ee9b114df8965bb8efd11557c936950c4b40cc1ce540bc98e117df88f4f0f08081cbfbabd2e614fcd7e800", "gasLimit"=>"0x8fcf88", "gasUsed"=>"0x8a34", "hash"=>"0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7", "logsBloom"=>"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000", "miner"=>"atp1vthcqh8cvl5lcz98zeh53r5mtjp89ulma9ghnd", "nonce"=>"0x037185230d3468bb10d034e1679330d7bc6fdc8cc4d61b5f0892148e81b14dfd8ba9ec00f52ebc67bfd58195ef8da0fb85ba82707fc90f379e5802c56f8b5e1dd0fb4f1cbb796b4e78de9d2813217c5476", "number"=>"0xa80ea9", "parentHash"=>"0x032bbd2d3f940b130bf79fe228ba2ec323cf3695f163a1aa0a57dec33fb67afb", "receiptsRoot"=>"0x9bc39b40af8267744a06a5060335eeaf8e2854244c710cdcc81d8768acc0654c", "size"=>"0x355", "stateRoot"=>"0x10475ff8bcfa50364e33883a2a6b0e92b12acf9727c703fe9d84078ad497cab0", "timestamp"=>"0x177ff4bfd89", "transactions"=>["0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c"], "transactionsRoot"=>"0x2c3e9057fe0bf02fc2dc09580eb11a678cd39893e0341722bb07ed53a9f89d88"}
```

### platon_get_block_by_number
通过区块高度返回区块信息

* 参数

    * `Integer | String` :可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
    * `Boolean`: true 返回区块全量信息，false 只返回交易的hash值
* 返回值

    * `Object`: 区块的结构，或如果未找到返回 `nil`
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_block_by_number(11013801,false)
=> {"extraData"=>"0xd9820f0086706c61746f6e88676f312e31332e34856c696e7578000000000000d0ce481ee2aeca0cc474c03882afa2bb25968d025f63ee9b114df8965bb8efd11557c936950c4b40cc1ce540bc98e117df88f4f0f08081cbfbabd2e614fcd7e800", "gasLimit"=>"0x8fcf88", "gasUsed"=>"0x8a34", "hash"=>"0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7", "logsBloom"=>"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000", "miner"=>"atp1vthcqh8cvl5lcz98zeh53r5mtjp89ulma9ghnd", "nonce"=>"0x037185230d3468bb10d034e1679330d7bc6fdc8cc4d61b5f0892148e81b14dfd8ba9ec00f52ebc67bfd58195ef8da0fb85ba82707fc90f379e5802c56f8b5e1dd0fb4f1cbb796b4e78de9d2813217c5476", "number"=>"0xa80ea9", "parentHash"=>"0x032bbd2d3f940b130bf79fe228ba2ec323cf3695f163a1aa0a57dec33fb67afb", "receiptsRoot"=>"0x9bc39b40af8267744a06a5060335eeaf8e2854244c710cdcc81d8768acc0654c", "size"=>"0x355", "stateRoot"=>"0x10475ff8bcfa50364e33883a2a6b0e92b12acf9727c703fe9d84078ad497cab0", "timestamp"=>"0x177ff4bfd89", "transactions"=>["0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c"], "transactionsRoot"=>"0x2c3e9057fe0bf02fc2dc09580eb11a678cd39893e0341722bb07ed53a9f89d88"}
```

### platon_get_transaction_by_hash
通过指定交易hash查询交易内容

* 参数

    `String`: 32Bytes 交易hash值
* 返回值

    `Object`: 交易object， 或未找到时返回 `nil`
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_transaction_by_hash("0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c")
=> {"blockHash"=>"0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7", "blockNumber"=>"0xa80ea9", "from"=>"atp196439hyj6mwnr23876cu59wfjaga2wntr36wz0", "gas"=>"0x186a0", "gasPrice"=>"0x1dcd65000", "hash"=>"0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c", "input"=>"0xc483821388", "nonce"=>"0xc48", "to"=>"atp1zqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqxxwje8t", "transactionIndex"=>"0x0", "value"=>"0x0", "v"=>"0x62298", "r"=>"0xe79901088b2d0825b2b333b587562d980fd1d7fe1053de5992ee3449ddf7276d", "s"=>"0x467bee5c4372f718de469f6e64a0927e95641ff585f01243b47f65407db4097e"}
```

### platon_get_transaction_by_block_hash_and_index
通过指定区块hash与交易index position 查询交易

* 参数

    * `String`: 32Bytes, 区块hash
    * `Integer`: 交易的索引位置
* 返回值

    `Object`: 交易object， 或未找到时返回 `nil`
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_transaction_by_block_hash_and_index("0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7",0)
 => {"blockHash"=>"0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7", "blockNumber"=>"0xa80ea9", "from"=>"atp196439hyj6mwnr23876cu59wfjaga2wntr36wz0", "gas"=>"0x186a0", "gasPrice"=>"0x1dcd65000", "hash"=>"0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c", "input"=>"0xc483821388", "nonce"=>"0xc48", "to"=>"atp1zqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqxxwje8t", "transactionIndex"=>"0x0", "value"=>"0x0", "v"=>"0x62298", "r"=>"0xe79901088b2d0825b2b333b587562d980fd1d7fe1053de5992ee3449ddf7276d", "s"=>"0x467bee5c4372f718de469f6e64a0927e95641ff585f01243b47f65407db4097e"}
```


### platon_get_transaction_by_block_number_and_index
通过区块高度及交易在区块中位置查询交易信息

* 参数

    * `Integer | String` :可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
    * `Integer`: 交易的索引位置
* 返回值

    `Object`: Transaction object
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_get_transaction_by_block_number_and_index(11013801,0)
 => {"blockHash"=>"0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7", "blockNumber"=>"0xa80ea9", "from"=>"atp196439hyj6mwnr23876cu59wfjaga2wntr36wz0", "gas"=>"0x186a0", "gasPrice"=>"0x1dcd65000", "hash"=>"0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c", "input"=>"0xc483821388", "nonce"=>"0xc48", "to"=>"atp1zqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqxxwje8t", "transactionIndex"=>"0x0", "value"=>"0x0", "v"=>"0x62298", "r"=>"0xe79901088b2d0825b2b333b587562d980fd1d7fe1053de5992ee3449ddf7276d", "s"=>"0x467bee5c4372f718de469f6e64a0927e95641ff585f01243b47f65407db4097e"}
```


###platon_get_transaction_receipt
根据交易hash返回交易回执

* 参数

    * `String`: 32Bytes ,交易哈希值
* 返回值

    * `Object`: Transaction Receipt Object, 未找到回执时返回nil
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
 client.platon_get_transaction_receipt("0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c")
 => {"blockHash"=>"0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7", "blockNumber"=>"0xa80ea9", "contractAddress"=>nil, "cumulativeGasUsed"=>"0x8a34", "from"=>"atp196439hyj6mwnr23876cu59wfjaga2wntr36wz0", "gasUsed"=>"0x8a34", "logs"=>[{"address"=>"atp1zqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqxxwje8t", "topics"=>[], "data"=>"0xf8f830b8f5f8f3f84fb84088e70a87f6acc8edf3b381c02f3c3317392e458af688920bbfe04e3694979847e25d59fb7fe2c1d3487f1ae5a7876fbcefabe06f722dfa28a83f3ca4853c42548307a2f5880518bc6e5f2b8cb4f84fb8409460fce5beea98e4d56c62a920bb041f45e48a5a7b96d12d02a16cbb20863be9c76491127533d9cefa5b4cec48ae6595b7ba347ef7dc8277cfb343eebde4646b8307a2f488060ff2b59a3ef16bf84fb840ab74f5500dd35497ce09b2dc92a3da26ea371dd9f6d438559b6e19c8f1622ee630951b510cb370aca8267f9bb9a9108bc532ec48dd077474cb79a48122f2ab038307bd438806d8e64037faad55", "blockNumber"=>"0xa80ea9", "transactionHash"=>"0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c", "transactionIndex"=>"0x0", "blockHash"=>"0xf71f0868b162b5b6d8240d44790a9cf4159add927c880218c9a17cb590bd6ea7", "logIndex"=>"0x0", "removed"=>false}], "logsBloom"=>"0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000", "status"=>"0x1", "to"=>"atp1zqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqxxwje8t", "transactionHash"=>"0x11b3640628b0a8b28fa9e7aa20f70962b9dd6eecc9d8c8521af3f4898cc3b88c", "transactionIndex"=>"0x0"}

```


### platon_evidences
返回双签证据

* 参数

    无
* 返回值

    * `String`: 证据字符串包含三种类型的证据：duplicatePrepare，duplicateVote，duplicateViewchange。 每种类型都包含多个证据，因此它是一个数组结构。 解析时请注意。
        * duplicatePrepare

        ```
            {
              "prepareA": {
                "epoch": 0,            //共识轮epoch值
                "viewNumber": 0,       //共识轮view值
                "blockHash": "0x06abdbaf7a0a5cb1deddf69de5b23d6bc3506fdadbdcfc32333a1220da1361ba",    //区块hash
                "blockNumber": 16013,       //区块number
                "blockIndex": 0,        //区块在一轮view中的索引值
                "blockData": "0xe1a507a57c1e9d8cade361fefa725d7a271869aea7fd923165c872e7c0c2b3f2",     //区块rlp编码值
                "validateNode": {            
                  "index": 0,     //验证人在一轮epoch中的索引值
                  "address": "0xc30671be006dcbfd6d36bdf0dfdf95c62c23fad4",    //验证人地址
                  "nodeId": "19f1c9aa5140bd1304a3260de640a521c33015da86b88cd2ecc83339b558a4d4afa4bd0555d3fa16ae43043aeb4fbd32c92b34de1af437811de51d966dc64365",    //验证人nodeID
                  "blsPubKey": "f93a2381b4cbb719a83d80a4feb93663c7aa026c99f64704d6cc464ae1239d3486d0cf6e0b257ac02d5dd3f5b4389907e9d1d5b434d784bfd7b89e0822148c7f5b8e1d90057a5bbf4a0abf88bbb12902b32c94ca390a2e16eea8132bf8c2ed8f"    //验证人bls公钥
                },
                "signature": "0x1afdf43596e07d0f5b59ae8f45d30d21a9c5ac793071bfb6382ae151081a901fd3215e0b9645040c9071d0be08eb200900000000000000000000000000000000"     //消息签名
              },
              "prepareB": {
                "epoch": 0,
                "viewNumber": 0,
                "blockHash": "0x74e3744545e95f4defc82d731504a39994b8013575491f83f7520cf796347b8f",
                "blockNumber": 16013,
                "blockIndex": 0,
                "blockData": "0xb11be0a3634e29281403d690c1a0bc38e96ea34b3aea0b0da2883800f610c3b7",
                "validateNode": {
                  "index": 0,
                  "address": "0xc30671be006dcbfd6d36bdf0dfdf95c62c23fad4",
                  "nodeId": "19f1c9aa5140bd1304a3260de640a521c33015da86b88cd2ecc83339b558a4d4afa4bd0555d3fa16ae43043aeb4fbd32c92b34de1af437811de51d966dc64365",
                  "blsPubKey": "f93a2381b4cbb719a83d80a4feb93663c7aa026c99f64704d6cc464ae1239d3486d0cf6e0b257ac02d5dd3f5b4389907e9d1d5b434d784bfd7b89e0822148c7f5b8e1d90057a5bbf4a0abf88bbb12902b32c94ca390a2e16eea8132bf8c2ed8f"
                },
                "signature": "0x16795379ca8e28953e74b23d1c384dda760579ad70c5e490225403664a8d4490cabb1dc64a2e0967b5f0c1e9dbd6578c00000000000000000000000000000000"
              }
            }
        ```
        
        * duplicateVote
        
        ```
	        {
	  "voteA": {
	    "epoch": 0,   //共识轮epoch值
	    "viewNumber": 0,    //共识轮view值
	    "blockHash": "0x58b5976a471f86c4bd198984827bd594dce6ac861ef15bbbb1555e7b2edc2fc9",   //区块hash
	    "blockNumber": 16013,   //区块number
	    "blockIndex": 0,    //区块在一轮view中的索引值
	    "validateNode": { 
	      "index": 0,    //验证人在一轮epoch中的索引值
	      "address": "0xc30671be006dcbfd6d36bdf0dfdf95c62c23fad4",  //验证人地址
	      "nodeId": "19f1c9aa5140bd1304a3260de640a521c33015da86b88cd2ecc83339b558a4d4afa4bd0555d3fa16ae43043aeb4fbd32c92b34de1af437811de51d966dc64365",   //验证人nodeID
	      "blsPubKey": "f93a2381b4cbb719a83d80a4feb93663c7aa026c99f64704d6cc464ae1239d3486d0cf6e0b257ac02d5dd3f5b4389907e9d1d5b434d784bfd7b89e0822148c7f5b8e1d90057a5bbf4a0abf88bbb12902b32c94ca390a2e16eea8132bf8c2ed8f"    //验证人bls公钥
	    },
	    "signature": "0x071350aed09f226e218715357ffb7523ba41271dd1d82d4dded451ee6509cd71f6888263b0b14bdfb33f88c04f76790d00000000000000000000000000000000"    //消息签名
	  },
	  "voteB": {
	    "epoch": 0,
	    "viewNumber": 0,
	    "blockHash": "0x422515ca50b9aa01c46dffee53f3bef0ef29884bfd014c3b6170c05d5cf67696",
	    "blockNumber": 16013,
	    "blockIndex": 0,
	    "validateNode": {
	      "index": 0,
	      "address": "0xc30671be006dcbfd6d36bdf0dfdf95c62c23fad4",
	      "nodeId": "19f1c9aa5140bd1304a3260de640a521c33015da86b88cd2ecc83339b558a4d4afa4bd0555d3fa16ae43043aeb4fbd32c92b34de1af437811de51d966dc64365",
	      "blsPubKey": "f93a2381b4cbb719a83d80a4feb93663c7aa026c99f64704d6cc464ae1239d3486d0cf6e0b257ac02d5dd3f5b4389907e9d1d5b434d784bfd7b89e0822148c7f5b8e1d90057a5bbf4a0abf88bbb12902b32c94ca390a2e16eea8132bf8c2ed8f"
	    },
	    "signature": "0x9bf6c01643058c0c828c35dc3277666edd087cb439c5f6a78ba065d619f812fb42c5ee881400a7a42dd8366bc0c5c88100000000000000000000000000000000"
	  }
	}
        ```
        
        * duplicateViewchange
        
        ```
	        {
	  "viewA": {
	    "epoch": 0,  
	    "viewNumber": 0, 
	    "blockHash": "0xb84a40bb954e579716e7a6b9021618f6b25cdb0e0dd3d8c2c0419fe835640f36",  //区块hash
	    "blockNumber": 16013, 
	    "validateNode": {
	      "index": 0,  
	      "address": "0xc30671be006dcbfd6d36bdf0dfdf95c62c23fad4", 
	      "nodeId": "19f1c9aa5140bd1304a3260de640a521c33015da86b88cd2ecc83339b558a4d4afa4bd0555d3fa16ae43043aeb4fbd32c92b34de1af437811de51d966dc64365",
	      "blsPubKey": "f93a2381b4cbb719a83d80a4feb93663c7aa026c99f64704d6cc464ae1239d3486d0cf6e0b257ac02d5dd3f5b4389907e9d1d5b434d784bfd7b89e0822148c7f5b8e1d90057a5bbf4a0abf88bbb12902b32c94ca390a2e16eea8132bf8c2ed8f"
	    },
	    "signature": "0x9c8ba2654c6b8334b1b94d3b421c5901242973afcb9d87c4ab6d82c2aee8e212a08f2ae000c9203f05f414ca578cda9000000000000000000000000000000000",
	    "blockEpoch": 0,
	    "blockView": 0
	  },
	  "viewB": {
	    "epoch": 0,
	    "viewNumber": 0,
	    "blockHash": "0x2a60ed6f04ccb9e468fbbfdda98b535653c42a16f1d7ccdfbd5d73ae1a2f4bf1",
	    "blockNumber": 16013,
	    "validateNode": {
	      "index": 0,
	      "address": "0xc30671be006dcbfd6d36bdf0dfdf95c62c23fad4",
	      "nodeId": "19f1c9aa5140bd1304a3260de640a521c33015da86b88cd2ecc83339b558a4d4afa4bd0555d3fa16ae43043aeb4fbd32c92b34de1af437811de51d966dc64365",
	      "blsPubKey": "f93a2381b4cbb719a83d80a4feb93663c7aa026c99f64704d6cc464ae1239d3486d0cf6e0b257ac02d5dd3f5b4389907e9d1d5b434d784bfd7b89e0822148c7f5b8e1d90057a5bbf4a0abf88bbb12902b32c94ca390a2e16eea8132bf8c2ed8f"
	    },
	    "signature": "0xed69663fb943ce0e0dd90df1b65e96514051e82df48b3867516cc7e505234b9ca707fe43651870d9141354a7a993e09000000000000000000000000000000000",
	    "blockEpoch": 0,
	    "blockView": 0
	  }
	}
        ```

* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.platon_evidences
=> "{}"  ## 暂无的状态
```



### admin_node_info
查看当前节点详情

* 参数

	无
* 返回值

	`Object`: 当前节点详情
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.admin_node_info
=> {node information } #略
```

### admin_peers

查看当前节点所连接的节点信息
* 参数

	无
* 返回值

	`Array`: 已连接的节点信息
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.admin_peers
=> [{Node 1 information} ,  {Node 2 information}, ..., {node information N}] # 略
```

### admin_get_program_version

查询code版本及签名

* 参数

	无
* 返回值

	`Object`: 包含两部分内容，版本与签名
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client. admin_get_program_version
=>{"Version"=>3840, "Sign"=>"0x169237f89092ad73f1db8dbb58703e59fe07e2ee5ce60aed16ff20c6313d800006b586ac074e03d7616664ee2c934bf5d2496dd4bd1592dae6c31a90641fbaaa00"}
```

### admin_get_schnorr_NIZK_Prove
返回BLS证明

* 参数

	无
* 返回值

	`String`: BLS证明
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.admin_get_schnorr_nizk_prove
=> "98d139a10b5e0d4d0968da2ed7d49cb654fcd3b19fd1cd88f6413480e88eb557ad66487ed9e97fe28a868e7da77e91d061df9996b4a1f1d675c415a962764770"
```

### admin_datadir
返回数据存储路径

* 参数

	无
* 返回值

	`String`: 数据路径
* 示例

```
client = Platon::HttpClient.new("http://127.0.0.1:6789")
client.admin_datadir
=> "/home/ubuntu/platon-node/data"
```
