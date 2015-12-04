class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :listings, dependent: :destroy
  has_many :sales, foreign_key: 'seller_id', class_name: 'Order'
  has_many :purchase, foreign_key: 'buyer_id', class_name: 'Order'
end
