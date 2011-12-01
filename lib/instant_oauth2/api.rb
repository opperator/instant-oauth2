require 'instant-oauth2'
require 'grape'

module InstantOAuth2
  class API < Grape::API
    helpers{ include InstantOAuth2::Helpers::Global }

    # resources :clients do
    #   post # create a new client for the authenticated user
    #   get  # retrieve a list of clients for the authenticated user
    #   get ':id' # retrieve a client application by its client_id
    #   put ':id' # update a client application
    #   delete ':id' # delete a client application
    # end

    resources :tokens do
      post do
        # REQUEST
        ## 2.3.1 Client Password
        # 1. Via HTTP Basic with Client ID and Client Secret
        # 2. Via params with client_id=XXX&client_secret=XXX

        ## 4.1.3 Access Token Request
        # grant_type=authorization_code&code=XXX(&redirect_uri=XXX)

        ## 6 Refreshing an Access Token
        # grant_type=refresh_token&refresh_token=XXX(&scope=XXX)
        # scope cannot include more than the original request

        # RESPONSE

        ## Success (4.1.4)
        # 
        # {"access_token":"XXX","token_type":""(,"expires_in":"","refresh_token":"","additional_param":""}

        # Error (5.2)
        # 400
        # error:
        #   invalid_request, invalid_client, invalid_grant, unauthorized_client, unsupported_grant_type, invalid_scope
        # error_description:
        #   OPTIONAL
        # error_uri:
        #   OPTIONAL
        # MUST INCLUDE 'Pragma: no-cache' header
      end
      
      get # a list of access tokens you have authorized
      delete # user-driven de-authorization of a bad client. should not allow for Opperator Webclient and Opperator API Client
    end
    
    # ONLY RESTRICTED CONFIDENTIAL API CLIENTS CAN
    # ACCESS THIS RESOURCE
    resources :codes do
      post # should be client-authenticated and include username and password. functionally similar to 
    end
  end
end
