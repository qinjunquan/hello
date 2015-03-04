class ChaoExchangeCodesController < ApplicationController

  def new 
    @exchange_code = ChaoExchangeCode.new
  end

  def new_js
	@exchange_code = ChaoExchangeCode.new
  end

  def create
    @exchange_code = ChaoExchangeCode.new(coin_params)
   #@exchange_code.coin_count = params[:coin_count]
    if @exchange_code.save
      redirect_to @exchange_code
	else
	  flash["coin_error"] = "The coin must be 10 or 100."
	  redirect_to new_js_chao_exchange_code_path 
	end
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

  def edit_js
	@exchange_code = ChaoExchangeCode.find(params[:id])
  end

  def update
	@exchange_code = ChaoExchangeCode.find(params[:id])
  	if @exchange_code.update(code_params)
      redirect_to @exchange_code
    else
	  redirect_to edit_js_chao_exchange_code_path
    end
  end

  def destroy 
	@exchange_code = ChaoExchangeCode.find(params[:id])
	@exchange_code.destroy
    redirect_to chao_exchange_codes_path
  end

  def exchange 
	@user = ChaoUser.new
	@exchange_code = ChaoExchangeCode.new
  end

  def exchange_js
	@user = ChaoUser.new
	@exchange_code = ChaoExchangeCode.new
  end

  def recharge
	debugger
	@user = ChaoUser.find_by_nick_name(params[:nick_name])
    @exchange_code = ChaoExchangeCode.find_by_code(params[:code])
    if @user.blank?
      #flash["user_error"] = "Nick Name not exist/can't be nir."
 	  redirect_to exchange_js_path
	else
 	  if @exchange_code.blank?
        #flash["code_error"] = "ExchangeCode not exist."
	    redirect_to exchange_js_path
	  else
 	    if @exchange_code.user_id.present?
         # flash["code_user_id"] = "The ExchangeCode had been used."
 	       redirect_to exchange_js_path
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

  def check_attr
	@user = ChaoUser.find_by_nick_name(params[:nick_name])
	@exchange_code = ChaoExchangeCode.find_by_code(params[:code])
    if(@user.blank?) 
	  render :json => { :name_is_exist => true, :code_is_exist => false, :code_is_used => false }
    else
	  if(@exchange_code.blank?)
	    render :json => { :name_is_exist => false, :code_is_exist => true, :code_is_used => false }
	  else
		if(@exchange_code.user_id.present?)
		  render :json => { :name_is_exist =>false, :code_is_exist => false, :code_is_used => true }
		else
		  render :json => { :name_is_exist =>false, :code_is_exist => false, :code_is_used => false }
		end
	  end
	end
  end


private
  def coin_params
    params.require(:chao_exchange_code).permit(:coin_count)
  end
  def code_params
	params.require(:chao_exchange_code).permit(:code,:coin_count)
  end
end
