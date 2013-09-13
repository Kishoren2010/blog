class CustomResponder < ActionController::Responder
  def to_html
    unless has_errors?
      if post? # create
        controller.flash.notice = "Created!"
      elsif patch? # update
        controller.flash.notice = "Updated!"
      end
    end

    super
  end
end