$(function(){
  function buildHTML(message){
    var html = `<div class="chat-content">
      <ul class="clearfix">
        <li>
          <p class="chat-content__chat-name">${message.name}
          </p>
        </li>
        <li>
          <p class="chat-content__chat-date">${message.time}
          </p>
        </li>
        <br>
        <li>
          <p class="chat-content__chat-message">  ${message.content}
          </p>`;
  if (message.image) {
    html += `<img src = '${message.image}' >`;
    }
    html +=`</li> </ul> </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
  })
  .done(function(data){
    var html = buildHTML(data);
    $('.chat-contents').append(html)
    $('.chat-footer__message-form').val('')
    $('.chat-footer__image-hidden').val('')
    $('.chat-footer__send').prop('disabled', false);
    $('.chat-contents').animate({scrollTop: $('.chat-contents')[0].scrollHeight}, 'fast');
  })
  .fail(function(){
    alert('メッセージか画像を入力してください');
    })
  })
  $(function auto_reload(){
    var path = location.pathname ;
    $(".chat-content").remove()
    $.ajax({
      url: path,
      type: "get",
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(messages){
      $.each(messages,function(i,message){
        var html = buildHTML(message);
        $('.chat-contents').append(html)
        $('.chat-contents').animate({scrollTop: $('.chat-contents')[0].scrollHeight}, 'fast');
      });
    $(document).on("turbolinks:load",function() {
      if (document.getElementsByClassName("chat-content").length !== 0) {
        window.timer = setInterval(auto_reload, 5000);
        }
      else if (document.getElementsByClassName("chat-content").length == 0) {
        clearInterval(window.timer);
        window.timer = ""
        }
      });
    });
  });
});
