require 'omniauth'
require 'devise'

OmniAuth.config.test_mode = true

def oauth_config_success(uid: '12345', affiliation: 'Veteran', verified: true)
  OmniAuth.config.mock_auth[:idme] = nil  # reset mock 

  OmniAuth.config.mock_auth[:idme] = OmniAuth::AuthHash.new({
    provider: 'IDme',
    uid: uid,
    info: {
      affiliation: affiliation,
      verified: verified
    }
  })
end

# Possible failure messages:

# invalid_request             The request is missing a required parameter, includes an unsupported parameter 
#                             or parameter value, or is otherwise malformed.
# invalid_client              The client identifier provided is invalid.
# unauthorized_client         The client is not authorized to use the requested response type.
# redirect_uri_mismatch       The redirection URI provided does not match a pre-registered value.
# access_denied               The end-user or authorization server denied the request.
# unsupported_response_type   The requested response type is not supported by the authorization server.
# invalid_scope               The requested scope is invalid, unknown, or malformed.

def oauth_config_failure(message:)
  OmniAuth.config.mock_auth[:idme] = nil  # reset mock 
  OmniAuth.config.mock_auth[:idme] = message
end