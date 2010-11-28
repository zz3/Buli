# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title
    base_title = "Bundesliga statistisch"
    if @title.nil?
      main_title
    else
       "#{base_title} | #{@title}"
    end
  end
end
