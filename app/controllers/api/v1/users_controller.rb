module Api

  module V1
    class UsersController < ApiController

      def sync
        render json: current_resource_owner.attributes, status: 200
      end

    end
  end

end
