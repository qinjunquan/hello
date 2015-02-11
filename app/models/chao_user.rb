class ChaoUser < ActiveRecord::Base
  has_many :chao_exchange_codes
  validates :nick_name, presence: true ,uniqueness:true
end
