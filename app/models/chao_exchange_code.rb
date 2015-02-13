class ChaoExchangeCode < ActiveRecord::Base
  belongs_to :chao_user
  validate :code , presence: true , uniqueness:true
  before_create :set_code

  def set_code
	new_code = rand(99999999999999999999)
    while ChaoExchangeCode.where(:code => new_code).present?
	  new_code = rand(99999999999999999999) 
    end
    self.code = new_code
  end
end
