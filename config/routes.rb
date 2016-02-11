Rails.application.routes.draw do
	if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :event_applications, only: [:index, :create, :new], path: '/event_entries' do
    collection do
      post '/confirm', to: 'event_applications#confirm', as: :confirm
      get '/complete', to: 'event_applications#complete', as: :complete
    end
  end
end
