module ApplicationHelper
  def page_title
    content_for?(:page_title) ? content_for(:page_title) : translate("global.title")
  end

  def page_description
    if content_for?(:page_description)
      content_for(:page_description)
    else
      translate("global.description")
    end
  end

  def page_title=(title)
    content_for(:page_title, title)
  end

  def page_description=(description)
    content_for(:page_description, description)
  end
end
