class ChaoExchangeCode < ActiveRecord::Base
  belongs_to :chao_user
  validates :code, :uniqueness => true
  before_create :set_code
  validate :coin_validate 

  def set_code
	new_code = rand(99999999999999999999)
    while ChaoExchangeCode.where(:code => new_code).present?
	  new_code = rand(99999999999999999999) 
    end
    self.code = new_code
  end

  def coin_validate
    self.errors.add(:coin_count,"coin_count is 10 or 100.") if (coin_count != 10 && coin_count != 100)
  end

end
