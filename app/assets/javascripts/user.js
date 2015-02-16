app.user = {
  init : function() {
    this.initStatus();
    this.bindingEvents();
  },

  initStatus : function() {
  },

  bindingEvents : function() {
    $("body").on("click", ".s-user-submit", this.validateUserName);
    $("body").on("change", "#user_nick_name", this.checkNickName);
  },

  validateUserName: function() {
    if($("#s-message").text() != "") {
      return false;
    }

    if($("#user_nick_name").val() == ""){
      $("#s-message").text("昵称不能为空");
      return false; 
    }
  },

  checkNickName : function() {
    if($("#user_nick_name").val() == ""){
      return false; 
    }
    $.ajax({
      url : "/users/check_name",
      data : {
        "nick_name" : $("#user_nick_name").val(),
        "authenticity_token" : $("meta[name='csrf-token']").attr("content")
      },
      type : "GET",
      success : function(result) {
        if(result.is_exist){
          $("#s-message").text("昵称已被使用");
        }
        else {
          $("#s-message").text("");
        }
      },
      error : function() {
        alert("不好意思,出错啦");
      }
    });
  }
}

