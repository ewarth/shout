class User < ActiveRecord::Base
  obfuscate_id

  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, presence: true, format: {with:  /\A[.[:alnum:]]+\z/, message: "Only alphanumerics and \".\" allowed"}
  validates :last_name, presence: true, format: {with:  /\A[.[:alnum:]]+\z/, message: "Only alphanumerics and \".\" allowed"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships, :dependent => :delete_all
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :posts, :dependent => :delete_all

end
