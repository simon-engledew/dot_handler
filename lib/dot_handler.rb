class DotHandler < ActionView::TemplateHandler
  
  def compile(path)
    <<-EOS
      controller.response.content_type ||= Mime::PNG
      
      #{ActionView::Template.handler_class_for_extension('erb').call(path)}
      @output_buffer = IO.popen("dot -Tpng", 'r+') do |io|
        io.write(@output_buffer)
        io.close_write
        io.read
      end
    EOS
  end
  
end