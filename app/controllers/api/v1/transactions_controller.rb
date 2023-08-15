module Api
  module V1
    class TransactionsController < ApiController

      def create

        render json: {}, status: :created
      end
    end
  end
end
