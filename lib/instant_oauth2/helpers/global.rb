module InstantOAuth2
  module Helpers
    module Global
      def client_application
        if env['HTTP_AUTHORIZATION']
          client_id, client_secret = *Rack::Auth::Basic::Request.new(env).credentials
        else
          client_id, client_secret = params[:client_id], params[:client_secret]
        end

        InstantOAuth2::ClientApplication().locate(client_id, client_secret)
      end
    end
  end
end
