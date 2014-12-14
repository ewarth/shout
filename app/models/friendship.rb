class Friendship < ActiveRecord::Base
  obfuscate_id
  belongs_to :user
  belongs_to :friend, :class_name => "User"
end
