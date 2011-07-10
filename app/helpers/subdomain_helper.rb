module SubdomainHelper

  private

  def subdomain(community)
    "http://#{community.to_param}.#{request.host}"
  end

  #TODO
  def url_for(options = nil)
    url = super
    if @mail_was_called || request.try(:host) && request.host.gsub(/#{configatron.host}/, '').present?
      if @mail_was_called ||
         options.is_a?(Hash) && !options[:only_path] && options[:host].gsub(/#{configatron.host}/).blank?
        url.gsub!(/http:\/\/(.+?)\/communities\/(.+?)\//, 'http://\2.\1/')
      else
        url.gsub!(/communities\/.+?\//, '')
      end
    elsif @mail_was_called
    end

    url
  end

end
