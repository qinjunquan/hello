app.chao_user = {
  init : function() {
    this.initStatus();
	this.bindingEvents();
  },
  initStatus : function() {
  },

  bindingEvents : function() {
    $("body").on("click", ".s-new-submit", this.validateUserName);
	$("body").on("click", ".s-edit-submit", this.validateUserName)
    $("body").on("change", "#chao_user_nick_name", this.checkNickName);
  },

  validateUserName : function(){
	if($("#new-message").text() != ""){
      return false;
	}

    if($("#chao_user_nick_name").val() == ""){
	  $("#new-message").text("Nick Name can't be nir.");
	  $("#edit-message").text("Nick Name can't be nir.");
	  return false;
	}
  },

  checkNickName : function() {
	$.ajax({
	  url : "/chao_users/check_name",
	  data : {
		"nick_name" : $("#chao_user_nick_name").val(),
		"authenticity_token" : $("meta[name='csrf-token']").attr("content")
	  },
	  type : "GET",
	  success : function(result) {
	    if(result.is_exist){
		  $("#new-message").text("Nick Name had been used.");
		  $("#edit-message").text("Nick Name can't be repeat.");
		}
		else{
		  $("#new-message").text("");
		  $("#new-message").text("");
		}
	  },
	  error : function() {
         alert("Sorry,It is Error.")
	  }
	})
  }
}
