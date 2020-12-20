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
  //return false;
}
