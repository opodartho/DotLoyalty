require 'swagger_helper'

describe 'Transactions' do
  path '/api/v1/{storeCode}/transactions' do
    post 'This method allows creating a new Transaction.' do
      tags 'Transactions'
      consumes 'application/json'
      parameter name: 'storeCode', in: :path, type: :string
      parameter name: :transaction, in: :body, schema: {
        type: :object,
        properties: {
          documentNumber: { type: :string },
          documentType: { type: :string },
          documentDate: { type: :string, format: 'date-time' },
          memberId: { type: :string, format: 'uuid' },
          grossValue: { type: :integer },
          labels: {
            type: :array,
            items: { '$ref' => '#/components/schemas/label'}
          },
          items: {
            type: :array,
            items: { '$ref' => '#/components/schemas/item' }
          },
          channelId: { type: :string },
          required: ['documentNumber', 'documentType', 'documentDate', 'memberId', 'grossValue', 'channelId']
        }

      }

      response '201', 'transaction created' do
        let(:storeCode) { create(:store).code }
        let(:transaction) {
          {
            documentNumber: '12345678',
            documentType: 'purchase'
          }
        }
        run_test!
      end

    end
  end

end
