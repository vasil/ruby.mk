helpers do

  def authorize(login, password)
    login == $config['credentials']['username'] && password == $config['credentials']['password']
  end

  def post_path(post)
    "/posts/#{post.permalink}"
  end

  def page_title
    if @post && !@post.new?
      "#{@post.title} - ruby.mk"
    else
      "ruby.mk"
    end
  end
end
