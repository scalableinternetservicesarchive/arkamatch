module ApplicationHelper

  def full_title_for_each_page(page_title = '')
    base_title = "Arkamatch"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

end
