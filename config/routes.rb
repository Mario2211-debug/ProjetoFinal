Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications", :as => :notifications

  mount ActionCable.server => '/cable'

  resources :users, :controller => 'users'
  get 'sessions/new'
  get 'users/new'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  #Rails Home#Route
  root 'home#home'
get '/search' => 'searches#search', :as => 'search_page'
  resources :searches

      get '/ranking' => 'home#ranking', :as => 'ranking'
      get '/categoria' => 'home#categoria', :as => 'categoria'

  #addempresas 'addempresas#index'
  #resources :perfil_empresarials
  resources :queixas, :controller => 'queixas'
  resources :empresas do
        get '/sobre' => 'empresa#sobre', :as => 'sobre'
        get '/queixas' => 'empresa#queixas', :as => 'queixas'
    member do
      post 'votar'
    end
  end


  resources :fornecedor do
    get '/pedidos' => 'fornecedor#pedidos', :as => 'Lista_de_pedidos'
    get 'fornecedor/ordem' => 'fornecedor#ordem', :as => 'ordem'
    get 'fornecedor/reputacao' => 'fornecedor#reputacao', :as => 'reputacao'
    get 'fornecedor/nao_resolvidas' => 'fornecedor#nao_resolvidas', :as => 'nao_resolvidas'
    get 'fornecedor/finalizadas' => 'fornecedor#finalizadas', :as => 'finalizadas'

    resources :assuntos, :controller => 'fornecedor/assuntos'
    resources :queixas, :controller => 'fornecedor/queixas'
    resources :empresas, :controller => 'fornecedor/empresas' do
       member do
         post 'votar'
       end
      resources :queixas, :controller => 'fornecedor/queixas'
      end
    end

    resources :consumidor do
      resources :perfil_empresarials, :controller => 'consumidor/perfil_empresarials' do
        member do
          get 'acompanhar'
        end
      end
      resources :addempresas, :controller => 'consumidor/addempresas'

      get 'consumidor/respondidas' => 'consumidor#respondidas', :as => 'respondidas'
      get 'consumidor/nao_respondidas' => 'consumidor#nao_respondidas', :as => 'nao_respondidas'
      get 'consumidor/pedidos' => 'consumidor#pedidos', :as => 'pedidos'
      get 'consumidor/avaliadas' => 'consumidor#avaliadas', :as => 'avaliadas'
      get 'consumidor/pedidos' => 'consumidor#desativadas', :as => 'desativadas'
      member do
      delete 'apagar' => 'consumidor#apagar'
      end
      resources :queixas, :controller => 'consumidor/queixas' do
          member do
            post 'novos_negociosS'
            post 'novos_negociosN'
            delete 'apagar'

          end
        end

    end



  resources :admin do

                resources :avaliacaos, :controller => 'admin/avaliacaos'
                resources :users, :controller => 'admin/users'
                resources :empresas, :controller => 'admin/empresas' do
                  member do
                    get 'analise'
                    get 'recusadas'
                  end
                end
                resources :addempresas, :controller => 'admin/addempresas'
                resources :queixas, :controller => 'admin/queixas'
                resources :assuntos, :controller => 'admin/assuntos'
                resources :sentimentos, :controller => 'admin/sentimentos'
                resources :atividades, :controller => 'admin/atividades'
                resources :situacaos, :controller => 'admin/situacaos'
                resources :solicitacoes, :controller => 'admin/solicitacoes'
              #  resources :perfil_empresarials, :controller => 'admin/perfil_empresarials'
                resources :perfil_empresarials, :controller => 'admin/perfil_empresarials' do
                member do
                  post 'aceitar'
                  post 'recusar'
                  get 'analise'
                  get 'recusadas'
                  get 'aceites'
                end
              end

                  #member do
                  #  get 'aceitar'
                #  end
                  #end

end

get    'admin/sessions/new'
get    'alogin' => 'admin/sessions#new'
post   'alogin' => 'admin/sessions#create'
delete 'alogout' => 'admin/sessions#destroy'





  resources :addempresas do
  collection do
    get :index
    get :new
 end
end


  #get 'login', :controller => 'user_sessions', :action => 'sessions#new'
  #get 'logout', :controller => 'user_sessions', :action => 'sessions#destroy'


end
