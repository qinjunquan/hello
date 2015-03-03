app.chao_exchange_code = {
  init : function() {
	this.initStatus();
	this.bindingEvents();
  },
  
  initStatus : function() {
debugger
  },
 
  bindingEvents : function() {
	$("body").on("click", ".s-new-code-submit", this.validateCoin);
	$("body").on("change", "#chao_exchange_code_coin_count", this.checkCoin);
  },
 
  validateCoin : function() {
	debugger
	if($("#chao_exchange_code_coin_count").val() == "") {
	  $("#error-message").text("Coin can't be nir");
	  return false;
	}
	if($("#error-message").text() != ""){
	  return false; 
	}
  },

  checkCoin : function() {
	if($("#chao_exchange_code_coin_count").val() != "10" && $("#chao_exchange_code_coin_count").val() != "100"){
	  $("#error-message").text("Coin count is 10 or 100.");
	  return false;
	}
	else{
	  $("#error-message").text("");
	}
  }
}
