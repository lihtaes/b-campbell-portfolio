module DefaultPageContent
    extend ActiveSupport::Concern

  included do
      before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Bradley Campbell | Professional Portfolio"
    @seo_keywords = "professional portfolio"
  end
end



