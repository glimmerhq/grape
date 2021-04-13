module Status
  class API < Grape::API
    version 'v1', using: :header, vendor: 'status'
    format :json
    prefix :api

    before do
      error!("401 Unauthorized", 401) unless authenticated
    end

    helpers do
      def warden
        env['warden']
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end

    resource :statuses do
      desc 'Return a timeline.'
      get :timeline do
        UserStatus.limit(20)
      end

      desc 'Return a status.'
      params do
        requires :id, type: Integer, desc: 'Status ID.'
      end
      route_param :id do
        get do
          UserStatus.find(params[:id])
        end
      end

      desc 'Create an anime status.'
      params do
        requires :status, type: String, desc: 'Your status.'
        requires :anime_id, type: Integer, desc: 'Anime ID.'
      end
      post do
        authenticated
        UserStatus.create!({
          user: current_user,
          body: params[:status],
          anime: params[:anime_id]
        })
      end

      desc 'Create an manga status.'
      params do
        requires :status, type: String, desc: 'Your status.'
        requires :manga_id, type: Integer, desc: 'Manga ID.'
      end
      post do
        authenticated
        UserStatus.create!({
          user: current_user,
          body: params[:status],
          manga: params[:manga_id]
        })
      end

      desc 'Create a regular status.'
      params do
        requires :status, type: String, desc: 'Your status.'
      end
      post do
        authenticated
        UserStatus.create!({
          user: current_user,
          body: params[:status]
        })
      end

      desc 'Update a status.'
      params do
        requires :id, type: String, desc: 'Status ID.'
        requires :status, type: String, desc: 'Your status.'
      end
      put ':id' do
        authenticated
        UserStatus.find(params[:id]).update({
          user: current_user,
          body: params[:status]
        })
      end

      desc 'Delete a status.'
      params do
        requires :id, type: String, desc: 'Status ID.'
      end
      delete ':id' do
        authenticate!
        UserStatus.find(params[:id]).destroy
      end
    end
  end
end
