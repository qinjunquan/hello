app.chao_user_exchange = {
  init : function () {
	this.initStatus();
	this.bindingEvents();
  },

  initStatus : function() {
  },

  bindingEvents : function() {
	$("body").on("click", ".s-exchange-submit", this.validate);
	$("body").on("change", "#nick_name", this.checkAttr);
	$("body").on("change", "#code", this.checkAttr);
  },

  validate :function (){
	if($("#nick_name").val() == ""){
	  $("#name-error-message").text("Nick name can't be nir.");
	  return false;
	}
	if($("#code").val() == ""){
	  $("#code-error-message").text("Exchange Code can't be nir.");
	  return false;
	}
	if($("#name-error-message").text != "" || $("#code-error-message").text != ""){
	  return false;
	}
  },

  checkAttr : function() {
	$.ajax({
	  url : "/chao_exchange_codes/check_attr",
	  data : {
		"nick_name" : $("#nick_name").val(),
		"code" : $("#code").val(),
		"authenticity_token" : $("meta[name='csrf-token']").attr("content")
	  },
	  type : "GET",
	  success : function(result){
		if(result.name_is_exist){
		  $("#name-error-message").text("Nick Name not exist.");
		  $("#code-error-message").text("");
		  return false;
		}
		else{
		  if(result.code_is_exist){
		    $("#name-error-message").text("");
		    $("#code-error-message").text("Exchange Code not exist.");
			return false;
		  }
		  else{
			if(result.code_is_used){
		      $("#name-error-message").text("");
		      $("#code-error-message").text("Exchange Code had been used.");
			  return false;
			}
			else{
		      $("#name-error-message").text("");
		      $("#code-error-message").text("");
			}
		  }
		}
	  },
	  error : function() {
		alert("Sorry,It is Error.");
	  }
	})
  }
}
