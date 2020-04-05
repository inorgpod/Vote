Rails.application.routes.draw do
  resources :candidates do
    member do
      post :vote
      get :abc
    end

    # collection do
    #   post :vote
    #   get :vote_list
    # end
  end
  
  #/candidates/:id/abc  =>member用法 可特別挑出某id的資料 保留id
  #/candidates/vote_list =>collection用法 列出所有id資料 不保留id
  #post的方法比較不容易被仿照因為會使用token保護 ,get容易被竄改
  # post '/candates/:id/vote', to: 'candidates#vote'
end
