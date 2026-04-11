# frozen_string_literal: true

require_relative "application"
Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  resources :accounts, only: [] do
    resources :locations, only: [:create, :destroy] do
      resources :devices, only: [:create, :show, :update, :destroy] do
        get :confirmation_image, on: :member
        get :screenshot, on: :member
        post :regenerate_tokens, on: :member
        post :repair, on: :member
      end
    end
  end

  get "d/:id", to: "token_displays#show", as: :token_display
  get "d/:id/screenshot", to: "token_displays#screenshot", as: :token_display_screenshot
  get "signed_screenshot/:sgid", to: "signed_screenshots#show", as: :signed_screenshot

  namespace :api, defaults: {format: :json} do
    get :setup, to: "trmnl#setup"
    get :display, to: "trmnl#display"
    post :log, to: "trmnl#log"
  end
end
