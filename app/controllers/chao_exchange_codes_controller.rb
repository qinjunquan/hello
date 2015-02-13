class ChaoExchangeCodesController < ApplicationController

  def new 
  end

  def create
    @exchange_code = ChaoExchangeCode.new
    @exchange_code.coin_count = params[:coin_count]
    @exchange_code.save
    redirect_to @exchange_code
    #@exchange_code.date = Time.now 
  end
  
  def show
    @exchange_code = ChaoExchangeCode.find(params[:id])
  end 
 
  def index
	@exchange_codes = ChaoExchangeCode.all
  end

  def edit
	@exchange_code = ChaoExchangeCode.find(params[:id])
  end

  def update
	@exchange_code = ChaoExchangeCode.find(params[:id])
	@exchange_code.update(code_params)
    redirect_to @exchange_code
  end

  def destroy 
	@exchange_code = ChaoExchangeCode.find(params[:id])
	@exchange_code.destroy
    redirect_to chao_exchange_codes_path
  end

private
  def code_params
	params.require(:chao_exchange_code).permit(:code,:coin_count)
  end
end
