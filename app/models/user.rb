class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates_format_of :name, :with => /\A(?=.* )[^0-9`!@#\\\$%\^&*\;+_=]{4,}\z/

  has_many :listings, dependent: :destroy
  has_many :sales, class_name: 'Order', foreign_key: 'seller_id'
  has_many :purchases, class_name: 'Order', foreign_key: 'buyer_id'
end
