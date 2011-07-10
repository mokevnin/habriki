module ApplicationHelper
  def current_page?(options)
    unless request
      raise "You cannot use helpers that need to determine the current "                  "page unless your view context provides a Request object "                  "in a #request method"
    end

    url_string = url_for(options)

    # We ignore any extra parameters in the request_uri if the
    # submitted url doesn't have any either.  This lets the function
    # work with things like ?order=asc
    if url_string.index("?")
      request_uri = request.fullpath
    else
      request_uri = request.path
    end
      request_uri.gsub!(/^\/communities\/.+?\//, '/')

    if url_string =~ /^\w+:\/\//
      url_string == "#{request.protocol}#{request.host_with_port}#{request_uri}"
    else
      url_string == request_uri
    end
  end
end
