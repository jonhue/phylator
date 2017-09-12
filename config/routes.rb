Rails.application.routes.draw do

    resources :quantities, only: [:index, :show] do
        get 'units_of_measurement', to: 'unit_of_measurements#index'
    end
    resources :calculations, path: '', except: [:index, :new, :edit] do
        resources :measurements, only: [:show]
    end
    get 'calculations', to: 'calculations#index'
    devise_for :users

    get 'setup', to: 'welcome#index'
    get 'drafts', to: 'welcome#drafts'

    root 'calculations#new'

    match '*path', to: 'errors#not_found', via: :all

end
