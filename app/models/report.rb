class Report < ActiveRecord::Base
  obfuscate_id
  belongs_to :user
  belongs_to :post
end
