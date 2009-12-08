get "/admin/?" do
  login_required
  haml :"admin/index"
end

get "/admin/posts/?" do
  login_required
  @posts = Post.all
  haml :"admin/posts/index"
end

get "/admin/posts/new" do
  login_required
  @post = Post.new
  haml :"admin/posts/new"
end

post "/admin/posts" do
  login_required
  @post = Post.new(params[:post])
  if @post.save
    redirect "/posts/#{@post.permalink}"
  else
    haml :"admin/posts/new"
  end
end

get "/admin/posts/:permalink/edit/?" do |permalink|
  login_required
  @post = Post.first(:permalink => permalink)
  haml :"admin/posts/edit"
end

put "/admin/posts/:permalink" do |permalink|
  login_required
  @post = Post.first(:permalink => permalink)
  permalink_was = @post.permalink
  if @post.update_attributes(params[:post])
    redirect "/posts/#{@post.permalink}"
  else
    @post.permalink = permalink_was # hack to ensure that permalink is not changed when record not saved
    haml :"admin/posts/edit"
  end
end

delete "/admin/posts/:permalink" do |permalink|
  login_required
  @post = Post.first(:permalink => permalink)
  @post.destroy
  redirect "/admin/posts"
end

get "/admin/posts/:permalink/delete/?" do |permalink|
  login_required
  @post = Post.first(:permalink => permalink)
  haml :"admin/posts/delete"
end
