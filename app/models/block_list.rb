class BlockList < ActiveRecord::Base
	
	
	scope :bsorted, lambda{order("block_lists.block_name")}
end
