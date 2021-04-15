## 验证人&质押模块


### 发起质押

发起质押(1000)

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `Integer`: typ, 表示使用账户自由金额还是账户的锁仓金额做质押，0: 自由金额； 1: 锁仓金额
	* `String`: benefitAddress,用于接受出块奖励和质押奖励的收益账户
	* `String`: nodeId,被质押的节点Id(也叫候选人的节点Id)
	* `String`: externalId,外部Id(有长度限制，给第三方拉取节点描述的Id)
	* `String`:	nodeName,被质押节点的名称(有长度限制，表示该节点的名称)
	* `String`: website,节点的第三方主页(有长度限制，表示该节点的主页)
	* `String`: details	节点的描述(有长度限制，表示该节点的描述)
	* `Integer`: amount , 质押的金额，填写单位 ATP或者 LAT 
	* `Integer`: rewardPer, 委托所得到的奖励分成比例，采用BasePoint 1BP=0.01%
	* `Integer`: programVersion, 程序的真实版本，治理rpc获取
	* `String`: programVersionSign,程序的真实版本签名，治理rpc获取
	* `String`: blsPubKey,bls的公钥
	* `String`: blsProof, bls的证明,通过拉取证明接口获取

* 返回值
	* `String`: 交易hash
	
* 示例

```
$client.ppos.create_staking $key,0,$key.bech32_address,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d","", "hello-dposclub","https://www.baidu.com","integration-node1-details", 100000, 8888,65536,"0x7f4d68fb9f100aff45b9c4730c102973ca7bd63d262c2707bb3e8b18ead2865272c1b4ed23de9bfd13ebb41b3562969cfdafc303e070c4b71723c997a8c53fbd01","69365262afd3c8a6971db4f8a97a0dec049b83a85905f41429c45635de483e03f058f7ae4befb592f391fa49f68a970581a3ab4688baf9eaa6c5d0bf3e80669536ac44c91db0bacc88379ccbb33561e08f03b722ef0f296a94c06873f7b71a06","ce36b2fd6d6d76cf3a7a35e77455b3cae261568454027bbb4c28268d3c5cc16f9f6e56ca9f44c723d3181011bd31d50e39437776c474708b02ffabf088d79a1f"
==> "0x46b763893c43e2296404dfbc1a669b76ca3be7e59f37783e2fa610cb48112df4"
```


### 修改质押

节点修改质押信息(1001)

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: benefitAddress,用于接受出块奖励和质押奖励的收益账户
	* `String`: nodeId,被质押的节点Id(也叫候选人的节点Id)
	* `String`: externalId,外部Id(有长度限制，给第三方拉取节点描述的Id)
	* `String`:	nodeName,被质押节点的名称(有长度限制，表示该节点的名称)
	* `String`: website,节点的第三方主页(有长度限制，表示该节点的主页)
	* `String`: details	节点的描述(有长度限制，表示该节点的描述)
	* `Integer`: amount , 质押的金额，填写单位 ATP或者 LAT 
	* `Integer`: rewardPer, 委托所得到的奖励分成比例，采用BasePoint 1BP=0.01%
	* `Integer`: programVersion, 程序的真实版本，治理rpc获取。可通过client.admin_get_program_version获取
	* `String`: programVersionSign,程序的真实版本签名，治理rpc获取，可通过client.admin_get_program_version 获取
	* `String`: blsPubKey,bls的公钥
	* `String`: blsProof, bls的证明,通过拉取证明接口获取。可通过client.admin_get_program_version 获取

* 返回值
	* `String`: 交易hash
	
* 示例

```
$client.ppos.update_staking_info($key,$key.bech32_address,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d",8866,"","hi-new-name-dpos","https://baidu.com","integration-node2-details")
=> "0xc5c1fd9a1259cb3a1c138bfc5a48a823e2018248f9e53c16b43f3fd2d91a8d98"
```

### 增加质押

节点增持质押（1002）

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: nodeId,被质押的节点Id(也叫候选人的节点Id)
	* `Integer`: typ, 表示使用账户自由金额还是账户的锁仓金额做质押，0: 自由金额； 1: 锁仓金额
	* `Integer`: amount , 质押的金额，填写单位 ATP或者 LAT 
	
* 返回值
	* `String`: 交易hash
	
* 示例

```
$client.ppos.add_staking($key,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d",0,20)
=> "0x2a2a523b1d1ba1c3430a1a4e40d485596ad455c56fe3cfc77ae42179890fd82e"
```

### 撤销质押
撤销质押(一次性发起全部撤销，多次到账),注意有退出时间。 （1003）

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: nodeId,被质押的节点Id(也叫候选人的节点Id)

* 返回值
	* `String`: 交易hash
	
* 示例

```
$client.ppos.cancel_staking($key,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d")
=> 0x6409062ce61ea5a74bf8be7f0f0cb04c1874de4aa3e4897c1ea71482ce9b78ec
```



### 发起委托  delegate

发起委托

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `Integer`: 0或者1，表示使用账户自由金额还是账户的锁仓金额做委托，0: 自由金额； 1: 锁仓金额
	* `String`: 被质押节点的node_id
	* `Integer`: amount, 委托金额 (按照最小单位算，1LAT = 10**18 von)

* 返回值
	* `String`: 交易hash
	
* 示例

```
# 质押10ATP/LAT

$client.ppos.delegate($key,0,"0x62f537293042326df6637a38319c3cb7abd032554137a800c25c29f0e07287407f96df7601b7b00d1c0c9b26a3eedffd3397af470ba564298e047c450202cfd2",10*10**18)
```

### 减少/撤销委托 reduce_delegate

减持/撤销委托(全部减持就是撤销)

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `Integer`: 质押时的区块高度，代表着某个node的某次质押的唯一标示
	* `String`: 被质押节点的node_id
	* `Integer`: amount, 委托金额 (按照最小单位算，1LAT = 10**18 von)

* 返回值
	* `String`: 交易hash
	
* 示例

```
## 取出10ATP/LAT质押

 $client.ppos.reduce_delegate($key,453063,"62f537293042326df6637a38319c3cb7abd032554137a800c25c29f0e07287407f96df7601b7b00d1c0c9b26a3eedffd3397af470ba564298e047c450202cfd2",10*10**18)
```

### 查询未领取的委托奖励 get_delegate_reward

查询账户在各节点未领取的奖励,funcType:5100

* 参数
	* `String`: 待查询地址，bech32 地址
	* `Array`: （可选）node_ids 默认为[]，即查询账户委托的所有节点。也可传入数组，每项元素为质押节点的node_id
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。

* 返回值
	* `String`: nodeID, 质押节点的ID
	* `String(0x十六进制字符串)`: reward, 未领取的奖励数量
	* `Integer`: stakingNum ,质押时的区块高度，代表着某个node的某次质押的唯一标示

* 示例

```
$client.ppos.get_delegate_reward($key.bech32_address)

or

$client.ppos.get_delegate_reward($key.bech32_address,["62f537293042326df6637a38319c3cb7abd032554137a800c25c29f0e07287407f96df7601b7b00d1c0c9b26a3eedffd3397af470ba564298e047c450202cfd2"])
```


### 提取所有委托奖励 withdraw_delegate_reward
提取账户当前所有的可提取的委托奖励,funcType:5000
* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入

* 返回值
	* `String`: 交易hash
	
* 示例

```
$client.ppos.withdraw_delegate_reward $key
```



### 查看结算周期验证人 get_epoch_validators

查看当前结算周期的验证人,funcType 1100

* 参数
	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

* 返回值

	Array,其中每个元素中参数如下：

	* `String`: NodeId ,被质押的节点Id(也叫候选人的节点Id)
	* `String`: BlsPubKey, BLS公钥
	* `String`: StakingAddress,发起质押时使用的账户(后续操作质押信息只能用这个账户，撤销质押时，von会被退回该账户或者该账户的锁仓信息中)
	* `String`: BenefitAddress, 用于接受出块奖励和质押奖励的收益账户
	* `Integer`: RewardPer, 节点收益返还比例, 10000为 100%
	* `Integer`: NextRewardPer
	* `Integer`: RewardPerChangeEpoch
	* `String`: StakingTxIndex,发起质押时的交易索引
	* `String`: ProgramVersion, 被质押节点的PlatON进程的真实版本号(获取版本号的接口由治理提供)
	* `Integer`: StakingBlockNum,发起质押时的区块高度
	* `String(0x十六进制字符串)`: Shares,当前候选人总共质押加被委托的von数目
	* `String`: ExternalId, 外部Id(有长度限制，给第三方拉取节点描述的Id)
	* `String`: NodeName,被质押节点的名称(有长度限制，表示该节点的名称)
	* `String`: Website,节点的第三方主页(有长度限制，表示该节点的主页)
	* `String`: Details,节点的描述(有长度限制，表示该节点的描述)

* 示例

```
client.ppos.get_epoch_validators
or
client.ppos.get_epoch_validators("latest")
```

### 查看共识周期验证人

查看当前共识周期的验证人，即共识中+出块中 ，funcType 1101。

* 参数
	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

* 返回值

	Array,其中每个元素中参数如下：

	* `String`: NodeId ,被质押的节点Id(也叫候选人的节点Id)
	* `String`: BlsPubKey, BLS公钥
	* `String`: StakingAddress,发起质押时使用的账户(后续操作质押信息只能用这个账户，撤销质押时，von会被退回该账户或者该账户的锁仓信息中)
	* `String`: BenefitAddress, 用于接受出块奖励和质押奖励的收益账户
	* `Integer`: RewardPer, 节点收益返还比例, 10000为 100%
	* `Integer`: NextRewardPer
	* `Integer`: RewardPerChangeEpoch
	* `String`: StakingTxIndex,发起质押时的交易索引
	* `String`: ProgramVersion, 被质押节点的PlatON进程的真实版本号(获取版本号的接口由治理提供)
	* `Integer`: StakingBlockNum,发起质押时的区块高度
	* `String(0x十六进制字符串)`: Shares,当前候选人总共质押加被委托的von数目
	* `String`: ExternalId, 外部Id(有长度限制，给第三方拉取节点描述的Id)
	* `String`: NodeName,被质押节点的名称(有长度限制，表示该节点的名称)
	* `String`: Website,节点的第三方主页(有长度限制，表示该节点的主页)
	* `String`: Details,节点的描述(有长度限制，表示该节点的描述)

* 示例

```
client.ppos.get_round_validators
or
client.ppos.get_round_validators("latest")
```

### 查看实时验证人列表 get_current_candidates

查看当前共识周期的验证人，即当前所有节点，含候选中 ，funcType 1102。

* 参数
	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

* 返回值
	
	Array,其中每个元素中参数如下：

	* `String`: NodeId ,被质押的节点Id(也叫候选人的节点Id)
	* `String`: BlsPubKey, BLS公钥
	* `String`: StakingAddress,发起质押时使用的账户(后续操作质押信息只能用这个账户，撤销质押时，von会被退回该账户或者该账户的锁仓信息中)
	* `String`: BenefitAddress, 用于接受出块奖励和质押奖励的收益账户
	* `Integer`: RewardPer, 节点收益返还比例, 10000为 100%
	* `Integer`: NextRewardPer
	* `Integer`: RewardPerChangeEpoch
	* `String`: StakingTxIndex,发起质押时的交易索引
	* `String`: ProgramVersion, 被质押节点的PlatON进程的真实版本号(获取版本号的接口由治理提供)
	* `String`: Status,	候选人的状态(状态是根据uint32的32bit来放置的，可同时存在多个状态，值为多个同时存在的状态值相加【0: 节点可用 (32个bit全为0)； 1: 节点不可用 (只有最后一bit为1)； 2： 节点出块率低但没有达到移除条件的(只有倒数第二bit为1)； 4： 节点的von不足最低质押门槛(只有倒数第三bit为1)； 8：节点被举报双签(只有倒数第四bit为1)); 16: 节点出块率低且达到移除条件(倒数第五位bit为1); 32: 节点主动发起撤销(只有倒数第六位bit为1)】
	* `Integer`: StakingEpoch, 当前变更质押金额时的结算周期
	* `Integer`: StakingBlockNum,发起质押时的区块高度
	* `String(0x十六进制字符串)`: Shares,当前候选人总共质押加被委托的von数目
	* `String(0x十六进制字符串)`: Released,发起质押账户的自由金额的锁定期质押的von
	* `String(0x十六进制字符串)`: ReleasedHes,发起质押账户的自由金额的犹豫期质押的von
	* `String(0x十六进制字符串)`: RestrictingPlan,发起质押账户的锁仓金额的锁定期质押的von
	* `String(0x十六进制字符串)`: RestrictingPlanHes,发起质押账户的锁仓金额的犹豫期质押的von
	* `Integer`: DelegateEpoch,最近一次对该候选人发起的委托时的结算周期
	* `String(0x十六进制字符串)`: DelegateTotal, 接受委托总数
	* `String(0x十六进制字符串)`: DelegateTotalHes
	* `String(0x十六进制字符串)`: DelegateRewardTotal 累计委托奖励
	* `String`: ExternalId, 外部Id(有长度限制，给第三方拉取节点描述的Id)
	* `String`: NodeName,被质押节点的名称(有长度限制，表示该节点的名称)
	* `String`: Website,节点的第三方主页(有长度限制，表示该节点的主页)
	* `String`: Details,节点的描述(有长度限制，表示该节点的描述)

* 示例

```
client.ppos.get_current_candidates
or
client.ppos.get_current_candidates("latest")
```

### 查询账户所代理的节点ID get_delegate_nodeids_by_addr

查询某账户锁代理的节点ID信息 , funcType 1103

* 参数
	* `String`: bech32 address ,委托人的账户地址
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。

* 返回值

	Array,其中每个元素中参数如下：
	* `String`: Addr , 委托人的账户地址
	* `Integer`: StakingBlockNum, 发起质押时的区块高度

* 示例

```
client.ppos.get_delegate_nodeids_by_addr("your_atp_or_lat_address")
```

### 查询单个委托信息 get_address_delegate_info
查询单个委托的相关信息， funType 1104 

* 参数
	* `Integer`:发起质押时的区块高度
	* `String`: 委托人账户地址
	* `String`: 验证人的节点Id
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

	Array,其中每个元素中参数如下：
	* `String`: Addr , 委托人的账户地址
	* `Integer`: StakingBlockNum, 发起质押时的区块高度
	* `String`: NodeId ,被质押的节点Id(也叫候选人的节点Id)
	* `Integer`: DelegateEpoch: 最近一次对该候选人发起的委托时的结算周期
	* `String(0x十六进制字符串)`: Released,发起质押账户的自由金额的锁定期质押的von
	* `String(0x十六进制字符串)`: ReleasedHes,发起质押账户的自由金额的犹豫期质押的von
	* `String(0x十六进制字符串)`: RestrictingPlan,发起质押账户的锁仓金额的锁定期质押的von
	* `String(0x十六进制字符串)`: RestrictingPlanHes,发起质押账户的锁仓金额的犹豫期质押的von
	* `String(0x十六进制字符串)`: CumulativeIncome
	
* 示例

```
$client.ppos.get_address_delegate_info(509677,"atp1842mp45vw30vgvzmylwdxmxxc00ggjp6q2gv8v","fad2c7f917eb3057d85031eae8bbda52541b527dd1d24a25e7e9b40d7329570a85dc45ec61b189a9cc30047ae906a08dc375558828e1c76dc853ce99b42b91e4")
```



### 查询质押信息 get_node_delegate_info

查询节点的质押信息 , funcType 1105

* 参数

	* `String`: 验证人的节点id
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。

* 返回值

	Array,其中每个元素中参数如下：
	* `String`: NodeId ,被质押的节点Id(也叫候选人的节点Id)
	* `String`: StakingAddress,发起质押时使用的账户(后续操作质押信息只能用这个账户，撤销质押时，von会被退回该账户或者该账户的锁仓信息中)
	* `String`: BenefitAddress, 用于接受出块奖励和质押奖励的收益账户
	* `String`: StakingTxIndex,发起质押时的交易索引
	* `String`: ProgramVersion, 被质押节点的PlatON进程的真实版本号(获取版本号的接口由治理提供)
	* `String`: Status,	候选人的状态(状态是根据uint32的32bit来放置的，可同时存在多个状态，值为多个同时存在的状态值相加【0: 节点可用 (32个bit全为0)； 1: 节点不可用 (只有最后一bit为1)； 2： 节点出块率低但没有达到移除条件的(只有倒数第二bit为1)； 4： 节点的von不足最低质押门槛(只有倒数第三bit为1)； 8：节点被举报双签(只有倒数第四bit为1)); 16: 节点出块率低且达到移除条件(倒数第五位bit为1); 32: 节点主动发起撤销(只有倒数第六位bit为1)】
	* `Integer`: StakingEpoch, 当前变更质押金额时的结算周期
	* `Integer`: StakingBlockNum,发起质押时的区块高度
	* `String(0x十六进制字符串)`: Shares,当前候选人总共质押加被委托的von数目
	* `String(0x十六进制字符串)`: Released,发起质押账户的自由金额的锁定期质押的von
	* `String(0x十六进制字符串)`: ReleasedHes,发起质押账户的自由金额的犹豫期质押的von
	* `String(0x十六进制字符串)`: RestrictingPlan,发起质押账户的锁仓金额的锁定期质押的von
	* `String(0x十六进制字符串)`: RestrictingPlanHes,发起质押账户的锁仓金额的犹豫期质押的von
	* `String`: ExternalId, 外部Id(有长度限制，给第三方拉取节点描述的Id)
	* `String`: NodeName,被质押节点的名称(有长度限制，表示该节点的名称)
	* `String`: Website,节点的第三方主页(有长度限制，表示该节点的主页)
	* `String`: Details,节点的描述(有长度限制，表示该节点的描述)	

* 示例

```
client.ppos.get_node_delegate_info
```

### 查询当前结算周期的区块奖励 get_block_reward
查询当前结算周期的区块奖励

* 参数
	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。

* 返回值
	* `String(0x十六进制字符串)` 

* 示例

```
client.ppos.get_block_reward
```

### 查询当前结算周期的质押奖励 get_staking_reward
查询当前结算周期的质押奖励
* 参数
	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。

* 返回值
	* `String(0x十六进制字符串)`

* 示例

```
client.ppos.get_staking_reward
```

## 治理模块

### 提交文本提案 submit_proposal
提交文本提案（2000）

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: verifier, 传入node_id,提交提案的验证人
	* `String(uint64)`: piDID, PIPID

* 返回值
	* `String`: 交易hash
* 示例

```
$client.ppos.submit_proposal($key,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d","1",{gas_price:(1.5 * 10**15).to_i,gas_limit:350000})
```

### 提交升级提案 update_proposal
提交升级提案2001

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: verifier, 传入node_id,提交提案的验证人
	* `String(uint64)`: piDID, PIPID
	* `Integer`: newVersion, 升级版本
	* `Integer`: endVotingRounds, 投票共识轮数量。说明：假设提交提案的交易，被打包进块时的共识轮序号时round1，则提案投票截止块高，就是round1 + endVotingRounds这个共识轮的第230个块高（假设一个共识轮出块250，ppos揭榜提前20个块高，250，20都是可配置的 ），其中0 < endVotingRounds <= 4840（约为2周，实际论述根据配置可计算），且为整数）
* 返回值
	* `String`: 交易hash
* 示例

```
$client.ppos.update_proposal($key,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d","15",2,10,{gas_price:(2.2 * 10**15).to_i,gas_limit:480000})
```

### 提交取消提案 cancel_proposal
提交取消提案 (2005)

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: verifier, 传入node_id,提交提案的验证人
	* `String(uint64)`: piDID, PIPID
	* `Integer`: endVotingRounds,投票共识轮数量。参考提交升级提案的说明，同时，此接口中此参数的值不能大于对应升级提案中的值
	* `String`: tobeCanceledProposalID,待取消的升级提案ID

* 返回值
	* `String`: 交易hash
* 示例

```
$client.ppos.cancel_proposal($key,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d","15",9,"0x01bb9da5d4a5649aa6adf5cfc87f2986c5bd8c7be3c1bf1addf30f4c99caf432")
```

### 给提案投票 vote_proposal
给提案投票(2003)

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: verifier, 传入node_id,提交提案的验证人
	* `String(uint64)`: piDID, PIPID
	* `Integer`: option,投票选项 , 1：支持；2：反对；3：弃权
	* `String`: programVersion,节点代码版本，有rpc的get_program_version接口获取
	* `String`: versionSign,代码版本签名，有rpc的get_program_version接口获取
* 返回值
	* `String`: 交易hash
* 示例

```
$client.ppos.vote_proposal($key,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d","15", 1, 65536,"0x7f4d68fb9f100aff45b9c4730c102973ca7bd63d262c2707bb3e8b18ead2865272c1b4ed23de9bfd13ebb41b3562969cfdafc303e070c4b71723c997a8c53fbd01")
```

### 版本声明 declare_version
版本声明(2004)

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `String`: verifier, 传入node_id,提交提案的验证人
	* `String`: programVersion,节点代码版本，有rpc的get_program_version接口获取
	* `String`: versionSign,代码版本签名，有rpc的get_program_version接口获取
* 返回值
	* `String`: 交易hash
* 示例

```
$client.ppos.declare_version($key,"9d3f5a4d80a4b5b89df5ad7dadd1ef0e54854decfd5c4b808d064d4e73374e9848ac6b02bc651e9ea15f184b2a4317ea50424402670799bb0910cafeb7323f4d",65536,"0x7f4d68fb9f100aff45b9c4730c102973ca7bd63d262c2707bb3e8b18ead2865272c1b4ed23de9bfd13ebb41b3562969cfdafc303e070c4b71723c997a8c53fbd01")
```

### 查询提案列表 get_proposals
查询提案列表，funcType 2102

* 参数
	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。

* 返回值

	Array,其中每个元素为Proposal数据结构

* 示例

```
client.ppos.get_proposals
```

### 提案查询 get_proposal_info
针对某提案进行查询，funcType:2100

* 参数
	* `String`: proposal id ,待查询的提案ID
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

	Proposal接口实现对象的json字符串

* 示例

```
client.ppos.get_proposal_info("0x261cf6c0f518aeddffb2aa5536685af6f13f8ba763c77b42f12ce025ef7170ed")
```

### 查询提案结果 get_proposal_result
针对某提案，查询提案结果， funcType: 2101

* 参数
	* `String`: proposal id ,待查询的提案ID
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。

* 返回值
	TallyResult对象的json字符串，TallyResult：保存单个提案结果的对象

	* `String`: proposalID 提案ID
	* `Integer`: yeas 赞成票票数
	* `Integer`: nays 反对票票数
	* `Integer`: abstentions 弃权票票数
	* `Integer`: accuVerifiers 在整个投票期内有投票资格的验证人总数
	* `Integer`: status 提案状态 。 1 投票中，2：投票通过，3：投票失败，4：（升级提案）预生效，5：（升级提案）生效，6：被取消

* 示例

```
client.ppos.get_proposal_result("0x261cf6c0f518aeddffb2aa5536685af6f13f8ba763c77b42f12ce025ef7170ed")
=> {"Code"=>0, "Ret"=>{"proposalID"=>"0x261cf6c0f518aeddffb2aa5536685af6f13f8ba763c77b42f12ce025ef7170ed", "yeas"=>102, "nays"=>0, "abstentions"=>0, "accuVerifiers"=>116, "status"=>5, "canceledBy"=>"0x0000000000000000000000000000000000000000000000000000000000000000"}}
```

### 查询节点的链生效版本 get_version_in_effect

查询节点的链生效版本, funcType:2103

* 参数

	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
	
* 返回值
	* 版本号的json字符串，如{65536}，表示版本是：1.0.0。 解析时，需要把ver转成4个字节。主版本：第二个字节；小版本：第三个字节，patch版本，第四个字节。解析示例见下:
* 示例

```
 client.ppos.get_version_in_effect
  {"Code"=>0, "Ret"=>3840}
  
 ## 版本号解析
 65535.to_s(16) => "10000" 即 1.0.0
 3840.to_s(16) => "f00" 即 0.15.0
 
```

### 查询提案投票人数 get_votes_number
指定proposal id 与区块hash,查询提案投票人数,funcType:2105

* 参数

	* 无
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
	
* 返回值
	* `Array`: 包含4个元素，含义分别为：累积可投票人数、赞成票数、反对票数、弃权票数

* 示例

```
client.ppos.get_votes_number("0x261cf6c0f518aeddffb2aa5536685af6f13f8ba763c77b42f12ce025ef7170ed","0x520a94980d6a243d469040936fcb64928e2a3bde1d79508ffd80e4a0d4fc3e57")

 => {"Code"=>0, "Ret"=>[116, 102, 0, 0]}

```

### 查询治理参数列表 get_govern_params
查询治理参数列表，funcType: 2106

* 参数
	* `String`, module name 
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
	
* 返回值
	Array,其中每个元素结构为:
	* `Object`: ParamItem :
		* `String`: Module
		* `String`: Name
		* `String`: Desc ,描述
	* `Object`: ParamValue :
		* `String`: StaleValue
		* `String`: Value ，值
		* `Integer`: ActiveBlock
* 示例

```
client.ppos.get_govern_params("staking")

=> {"Code"=>0, "Ret"=>[{"ParamItem"=>{"Module"=>"staking", "Name"=>"stakeThreshold", "Desc"=>"minimum amount of stake, range: [10000000000000000000000, 1000000000000000000000000]"}, "ParamValue"=>{"StaleValue"=>"", "Value"=>"10000000000000000000000", "ActiveBlock"=>0}}, {"ParamItem"=>{"Module"=>"staking", "Name"=>"operatingThreshold", "Desc"=>"minimum amount of stake increasing funds, delegation funds, or delegation withdrawing funds, range: [1000000000000000000, 10000000000000000000000]"}, "ParamValue"=>{"StaleValue"=>"", "Value"=>"1000000000000000000", "ActiveBlock"=>0}}, {"ParamItem"=>{"Module"=>"staking", "Name"=>"maxValidators", "Desc"=>"maximum amount of validator, range: [25, 201]"}, "ParamValue"=>{"StaleValue"=>"", "Value"=>"101", "ActiveBlock"=>0}}, {"ParamItem"=>{"Module"=>"staking", "Name"=>"unStakeFreezeDuration", "Desc"=>"quantity of epoch for skake withdrawal, range: (MaxEvidenceAge, 336]"}, "ParamValue"=>{"StaleValue"=>"", "Value"=>"168", "ActiveBlock"=>0}}, {"ParamItem"=>{"Module"=>"staking", "Name"=>"rewardPerMaxChangeRange", "Desc"=>"Delegated Reward Ratio The maximum adjustable range of each modification, range: [1, 2000]"}, "ParamValue"=>{"StaleValue"=>"", "Value"=>"500", "ActiveBlock"=>0}}, {"ParamItem"=>{"Module"=>"staking", "Name"=>"rewardPerChangeInterval", "Desc"=>"The interval for each modification of the commission reward ratio, range: [2, 28]"}, "ParamValue"=>{"StaleValue"=>"", "Value"=>"10", "ActiveBlock"=>0}}]}
```

### 查询当前块高的治理参数值 get_govern_param_value
查询当前块高的治理参数值 funcType:2106
* 参数

	* `String`, module name  模块名称
	* `String`, name ,方法名
	* `Integer | String` : (可选，默认"latest")可传递区块号 或 "lastest", "earliest","pending"。详见默认区块参数 [默认区块参数说明](#默认区块参数说明)。
* 返回值

	* `String`: 该param的值

* 示例

```
$client.ppos.get_govern_param_value("staking","stakeThreshold")
=> {"Code"=>0, "Ret"=>"10000000000000000000000"}
```


### 举报双签 report_duplicate_sign
举报节点双签（3000）

* 参数
	* `Object`: 发起方的 Key 实例，通过 Platon::Key.new 创建或导入
	* `Integer`: typ, 代表双签类型，1：prepareBlock，2：prepareVote，3：viewChange
	* `String`: data, 单个证据的json值，格式参照[RPC接口Evidences]
* 返回值
	* `String`: 交易hash
* 示例

```
$client.ppos.report_duplicate_sign($key,1,"{}")
```

### 查询节点被举报双签 get_node_oversign
funcType:3001

* 参数
	* `Integer`: type 代表双签类型，1：prepareBlock，2：prepareVote，3：viewChange
	* `String`: 节点ID ，64bytes
	* `Integer`: 多签的块高
* 返回值
	* `String`: 举报的交易hash
* 示例

```
$client.ppos.get_node_oversign(1,"0xed552a64f708696ac53962b88e927181688c8bc260787c82e1c9c21a62da4ce59c31fc594e48249e89392ce2e6e2a0320d6688b38ad7884ff6fe664faf4b12d9",12300000)
```


## 创建锁仓计划 create_restricting_plan

创建锁仓计划（4000）

* 参数
	* `String`: address ,锁仓释放到账的账户
	* `Array`: 锁仓计划列表，数组，数组结构为
		- `Integer`: epoch,锁仓的周期，表示结算周期的倍数。与每个结算周期出块数的乘积表示在目标区块高度上释放锁定的资金。Epoch * 每周期的区块数至少要大于最高不可逆区块高度。
		- `Integer`: amount, 标识目标区块上待释放的金额 。注意需要大于治理参数中minimumRelease

* 返回值
	* `String`: 举报的交易hash
	
* 示例

```
$client.ppos.create_restricting_plan($key,"lat10z2enrjz2lk2hz3n9z3l2gmyxujnhuaqklw6dd",[[50,200 * 10**18]])
```

## 获取锁仓计划 get_restricting_info

获取锁仓计划（4100）

* 参数
	* `String`: address 锁仓释放到账的账户

* 返回值
	* `String`: balance, 总锁仓余额-已释放金额
	* `String`: pledge , 质押/抵押金额
	* `String`: debt , 欠释放金额
	* `Array`: plans ,  锁仓分录信息，json数组：[{"blockNumber":"","amount":""},...,{"blockNumber":"","amount":""}]。其中：
blockNumber：`Integer` ,释放区块高度
amount：`string(0x十六进制字符串)`，释放金额

* 示例

```
$client.ppos.get_restricting_info("lat10z2enrjz2lk2hz3n9z3l2gmyxujnhuaqklw6dd")

=>{"Code"=>0, "Ret"=>{"balance"=>"0xad78ebc5ac6200000", "debt"=>"0x0", "plans"=>[{"blockNumber"=>2074750, "amount"=>"0xad78ebc5ac6200000"}], "Pledge"=>"0x0"}}
```


