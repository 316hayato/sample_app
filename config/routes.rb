Rails.application.routes.draw do
  # ここでは自分がURLを作成するか、画面上の操作から新たにURLを作成するかでどのような動きをしていくのかを導く
  # ここで新しく作る場合、画面でつくる場合で記載も変わる(get、postなど)
  # URLに対しどうするか(受け取るのか追加するのか)を指定し、アクションを起こさせるようコントローラーに指示を送る
  get '/top' => 'homes#top' #この場合URL(/top)を受け取り(get)、コントローラーにアクション(homes#top)を起こさせる
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
