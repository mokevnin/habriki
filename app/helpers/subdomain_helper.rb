module SubdomainHelper

  private

  def subdomain(community)
    "http://#{community.to_param}.#{request.host}"
  end

  def url_for(options = nil)
    url = super
    if request.try(:host) && request.host.gsub(/#{configatron.host}/, '').present?
      if options.is_a?(Hash) && !options[:only_path] && options[:host].gsub(/#{configatron.host}/).blank?
        url.gsub!(/http:\/\/(.+?)\/communities\/(.+?)\//, 'http://\2.\1/')
      else
        url.gsub!(/communities\/.+?\//, '')
      end
    end

    url
  end

end
