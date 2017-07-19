$(function() {

var user_list = $("#user-search-result");
var member_list = $("#chat-group-users");

function appendUser(user) {
   var html = `<div class='chat-group-user clearfix'>
          <p class='chat-group-user__name'>${user.name}</p>
          <a class="user-search-add chat-group-user__btn chat-group-user__btn--add js-add-btn" data-user-id=${user.id} data-user-name=${user.name}>追加</a>
          </div>`
    user_list.append(html);
  }

 function appendNoUser(user) {
    var html = `<li>
                  <div class='listview__element--right-icon'>${ user }</div>
                </li>`
    user_list.append(html);
  }

 function addUser(userid, name) {
    var html = `<div class='chat-group-user clearfix js-chat-member'>
               <input name='group[user_ids][]' type='hidden' value='${userid}'>
                <p class='chat-group-user__name'>${name}</p>
                <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
                </div>`
    member_list.append(html);
  }

  $(".chat-user-form__input").on("keyup", function() {
    var input = $(".chat-user-form__input").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(users) {
      $("#user-search-result").empty();
        if (users.length !== 0  && input.length !== 0) {
          users.forEach(function(user){
            appendUser(user);
          });
        }
        if(users.length == 0  && input.length !== 0) {
          appendNoUser("一致するユーザはいません");
        }
    })
    .fail(function() {
      alert('ユーザ検索に失敗しました');
    });
  });
    $(document).on("click", ".user-search-add" ,function() {
      var userid = $(this).data("user-id");
      var name = $(this).data("user-name");
      addUser(userid, name);
    $(this).parent().remove();
    });
    $(document).on("click", ".user-search-remove" ,function() {
    $(this).parent().remove();
    });
});


