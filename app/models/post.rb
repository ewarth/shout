class Post < ActiveRecord::Base
  obfuscate_id

  validates :post_text, presence: true, format: {with:  /\A[\/\\\"\'\?[:alnum:]!@#\$%^&*()+=~`\[\]{};\:._-]+\z/, message: "Invalid characters are contained in the post"}

  belongs_to :user
end
