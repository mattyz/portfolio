recieved(data) {
  channel
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
];
 // $('#comments)
