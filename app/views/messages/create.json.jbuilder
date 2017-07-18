  json.name  current_user.name
  json.content  @message.content
  json.time  @message.created_at.strftime('%Y年%m月%d日 %H:%M')
  json.image  @message.image.url
  json.user_id  @message.user.id
  json.group_id  @message.group.id
