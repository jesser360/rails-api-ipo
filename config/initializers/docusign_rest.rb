# This file was generated by the docusign_rest:generate_config rake task.
# You can run 'rake docusign_rest:generate_config' as many times as you need
# to replace the content of this file with a new config.

require 'docusign_rest'

DocusignRest.configure do |config|
  config.username       = Rails.application.credentials.docusign[:email]
  config.password       = Rails.application.credentials.docusign[:password]
  config.integrator_key = 'ec8c3930-db3c-4b8e-9e9d-3f2f0b5ce109'
  config.account_id     = '6945698'
  config.endpoint       = 'https://www.docusign.net/restapi/v2/login_information'
  config.api_version    = 'v2'
end