require 'dot_handler'
ActionView::Template::register_template_handler 'dot', DotHandler 
ActionController::Base.exempt_from_layout :dot
