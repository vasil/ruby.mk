get "/posts" do
  @posts = Post.all
  erb :index
end

get "/posts/:permalink" do |permalink|
  @post = Post.first(:permalink => permalink)
  @comment = Comment.new
  haml :show
end

post "/posts/:permalink/comments" do |permalink|
  @post = Post.first(:permalink => permalink)
  @comment = @post.comments.build(params[:comment])
  if @comment.save
    redirect post_path(@post)
  else
    haml :show
  end
end
