/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * DS208: Avoid top-level this
 * DS209: Avoid top-level return
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
jQuery(document).on('turbolinks:load', function() {});
const comments = $('#comments');
if (comments.length < 0) {
  App.global_chat = App.cable.subscriptions.create({
    channel: "BlogsChannel",
    blog_id: comments.data('blog-id')
  }, {
  connected() {},
  disconnected() {},
  recieved(data) {
    return comments.append(data['comment']);
  },
  send_comment(comment, blog_id) {}
}
  );
  this.perform('send_comment', {comment, blog_id});
  $('#new_comment').submit(function(e) {});
  const $this = $(this);
  const textarea = $this.find('#comment_content');
  if ($.trim(textarea.val()).length > 1) {
    //see blog channel for send_comment method
    App.global_chat.send_comment(textarea.val(),
    comments.data('blog-id'));
    textarea.val('');
  }
  e.preventDefault();
  return false;
}


/**  channel
  console.log("Recieving:")
  console.log(data.content)
  comments.append data('comment')
}

connected(){
  console.log("connected!!")
}

send_comment(comment, blog_id) {
  channel
  console.log("send comment:")
  console.log(blog_id)
  @perform 'send_coment', comment; comment, blog_id: blog_id
}

$('new_comment').submit (e) {
  $this = $(this)
  textarea = $this.find('#comment_content')
//below coffescript placeholder
App.global_chat = App.cable.subscriptions.create {
  channel: "Blogs Channel"
  blog_id: comments.data('blog-id')
];**/
 // $('#comments)
