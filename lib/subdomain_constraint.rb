class SubdomainConstraint
  def self.matches?(request)
    #TODO
    return true
    request.subdomain.present? && request.subdomain != "www"
  end
end
