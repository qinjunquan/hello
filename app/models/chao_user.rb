class ChaoUser < ActiveRecord::Base

  has_many :chao_exchange_codes
  accepts_nested_attributes_for :chao_exchange_codes 
  validates :nick_name, presence: true ,uniqueness:true

end
