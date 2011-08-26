module WebHelper
  def active_class(url)
    current_page?(url) ? {:class => 'active'} : {}
  end
end

