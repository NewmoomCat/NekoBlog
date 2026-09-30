class PostsController < ApplicationController
  def index
    @about = <<~A
学习的语言: PHP, Java. Python和Ruby
联系EMAIL: 3649745663@qq.com
A

    render 'posts/index'
  end

  def show
    file_name = params[:id].to_s.downcase.gsub(/[^a-z0-9_-]/, "")
    file_path = Rails.root.join("app", "markdowns", "#{file_name}.md")
    if File.exist?(file_path)
      md_text = File.read(file_path)
      @h_content = Kramdown::Document.new(md_text, input: "GFM").to_html
      @p_title = params[:id].capitalize
    else
      render plain: "Markdown not found: #{file_path}", status: 404
    end
    render 'posts/show'
  end
end
