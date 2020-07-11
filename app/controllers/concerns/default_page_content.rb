module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Portmanteau | My Portfolios"
    @seo_keywords = "Matt Zickel Portfolio"
  end

end
