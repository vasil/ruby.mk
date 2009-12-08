# index
get "/" do
  @posts = Post.all
  haml :"index"
end


