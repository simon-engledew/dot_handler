class DotHandler < ActionView::TemplateHandlers::ERB
  
  Formats = Set.new(['png', 'gif'])
  DefaultFormat = 'png'
  
  def render(template, local_assigns = {})
    format = DotHandler::Formats.include?(format = @view.template_format)? format : DotHandler::DefaultFormat
    
    @view.controller.headers["Content-Type"] ||= "image/#{format}"
    
    IO.popen("dot -T#{format}", 'r+') do |io|
      io.write(super(template))
      io.close_write
      io.read
    end
  end
end