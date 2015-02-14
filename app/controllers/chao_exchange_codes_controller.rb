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

  def exchange 
  end


  def recharge
	@user = ChaoUser.find_by_nick_name(params[:nick_name])
    @exchange_code = ChaoExchangeCode.find_by_code(params[:code])
    if @user.blank?
 	  render 'exchange'
	else
 	  if @exchange_code.blank?
	    render 'exchange'
	  else
 	    if @exchange_code.user_id.present?
 	      render 'exchange'
        else
          @user.coin_count += @exchange_code.coin_count
		  @exchange_code.user_id = @user.id
 		  @exchange_code.date = Time.now
		  @user.save
		  @exchange_code.save
 		  redirect_to record_chao_users_path
 		end
 	  end
    end
  end

  def record
	@records = ChaoExchangeCode.where("user_id is not null")
    @user = ChaoUser.all
    #@records.each do |recode|
	#  if recode.user_id.present?
	#	record << @user_record
	#  end
    #end
  end

private
  def code_params
	params.require(:chao_exchange_code).permit(:code,:coin_count)
  end
end
