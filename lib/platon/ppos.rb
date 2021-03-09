module Platon
  class Ppos

  	def initialize(client)
  		@client = client
  	end

  end
end



# {
#     '1000': ['typ', 'benefitAddress', 'nodeId', 'externalId', 'nodeName', 'website', 'details', 'amount', 'rewardPer', 'programVersion', 'programVersionSign', 'blsPubKey', 'blsProof'],
#     '1001': ['benefitAddress', 'nodeId', 'rewardPer', 'externalId', 'nodeName', 'website', 'details'],
#     '1002': ['nodeId', 'typ', 'amount'],
#     '1003': ['nodeId'],
#     '1004': ['typ', 'nodeId', 'amount'],
#     '1005': ['stakingBlockNum', 'nodeId', 'amount'],
#     '1100': [],
#     '1101': [],
#     '1102': [],
#     '1103': ['addr'],
#     '1104': ['stakingBlockNum', 'delAddr', 'nodeId'],
#     '1105': ['nodeId'],
#     '1200': [],
#     '1201': [],
#     '1202': [],

#     '2000': ['verifier', 'pIDID'],
#     '2001': ['verifier', 'pIDID', 'newVersion', 'endVotingRounds'],
#     '2002': ['verifier', 'pIDID', 'module', 'name', 'newValue'],
#     '2005': ['verifier', 'pIDID', 'endVotingRounds', 'tobeCanceledProposalID'],
#     '2003': ['verifier', 'proposalID', 'option', 'programVersion', 'versionSign'],
#     '2004': ['verifier', 'programVersion', 'versionSign'],
#     '2100': ['proposalID'],
#     '2101': ['proposalID'],
#     '2102': [],
#     '2103': [],
#     '2104': ['module', 'name'],
#     '2105': ['proposalID', 'blockHash'],
#     '2106': ['module'],

#     '3000': ['typ', 'data'],
#     '3001': ['typ', 'addr', 'blockNumber'],

#     '4000': ['account', 'plan'],
#     '4100': ['account'],

#     '5000': [],
#     '5100': ['address', 'nodeIDs'],
# }