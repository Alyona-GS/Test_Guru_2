Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
  end

  direct :github do |author, repo|
    "https://github.com/#{author}/#{repo}"
  end
end
