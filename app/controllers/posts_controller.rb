class PostsController < ApplicationController
  def index
    @about = <<~A
学习的语言: PHP, Java. Python和Ruby
联系EMAIL: 3649745663@qq.com
A

    render 'posts/index'
  end

  def show
    render 'posts/show'
  end
end
