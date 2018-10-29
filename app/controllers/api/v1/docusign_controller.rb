class Api::V1::DocusignController < ApplicationController
  require 'docusign_rest.rb'

  # POST /docusign
  # POST /docusign.json
  def create
    client = DocusignRest::Client.new
    document_envelope_response = client.create_envelope_from_document(
    email: {
      subject: "test email subject",
      body: "this is the email body and it's large!"
    },
    # If embedded is set to true in the signers array below, emails
    # don't go out to the signers and you can embed the signature page in an
    # iframe by using the client.get_recipient_view method
    signers: [
      {
        embedded: true,
        name: 'Joe Dimaggio',
        email: 'joe.dimaggio@example.org',
        role_name: 'Issuer',
        sign_here_tabs: [
          {
            anchor_string: 'sign here',
            anchor_x_offset: '-30',
            anchor_y_offset: '35'
          }
        ]
      },
    ],
    files: [
      {path: '/Users/jesse/code/ipo/rails-api-ipo/pdf/NDA.pdf', name: 'document.pdf'},
    ],
    status: 'sent'
    )
    # url = client.get_recipient_view(envelope_id: document_envelope_response['envelopeId'], name: "Joe Dimaggio", email: "joe.dimaggio@example.org", return_url: 'http://google.com')['url']
    # `open #{url}`
    puts "ENVOOPE"
    puts document_envelope_response
    @document = Document.create
    @document.docu_id = client.get_account_id
    @document.save!
    # render json: @document
    return document_envelope_response
  end
end
