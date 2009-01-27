class DotHandler < ActionView::TemplateHandlers::ERB

  def render(template, local_assigns = {})
    @view.controller.headers["Content-Type"] ||= 'image/png'
    
    input = super(template)
    
    output = IO.popen('dot -Tpng', 'r+') do |io|
      io.write(input)
      io.close_write
      io.read
    end
    
    output
  end
end