app.chao_exchange_code = {
  init : function() {
	this.initStatus();
	this.bindingEvents();
  },
  
  initStatus : function() {
  },
 
  bindingEvents : function() {
	$("body").on("click", ".s-new-code-submit", this.validateCoin);
	$("body").on("click", ".s-edit-code-submit", this.validateCoin);
  },
 
  validateCoin : function() {
	if($("#error-message").text() != ""){
	  return false; 
	}
	if($("#chao_exchange_code_coin_count").val() == "") {
	  $("#error-message").text("Coin can't be nir");
	  return false;
	}
	if($("#chao_exchange_code_coin_count").val() != "10" && $("#chao_exchange_code_coin_count").val() != "100"){
	  $("#error-message").text("Coin count is 10 or 100.");
	  return false;
	}
  }
}
