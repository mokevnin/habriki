module Middlewares
  class RewriteSubdomainToPath
    def initialize(app)
      @app = app
    end

    def call(env)
      server_name = env['SERVER_NAME']
      if server_name != '_'
        http_host = (env['HTTP_HOST'] || '').gsub(/:[\d]+/, '')
        subdomain = http_host.gsub(/\.?#{server_name}/, '')
        if subdomain.present? && subdomain !~ /www|mail/
          env['PATH_INFO'] = ['communities', subdomain, env['PATH_INFO']].join('/')
          env['HTTP_X_FORWARDED_HOST'] = [server_name, http_host].join(', ')
          Rails.logger.info("Reroute: mapped #{http_host} => #{server_name}")
          Rails.logger.info("Subdomain: #{subdomain}")
        end
      end

      @app.call(env)

    end
  end
end
