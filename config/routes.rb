# frozen_string_literal: true

Rails.application.routes.draw do
  # https://guides.rubyonrails.org/routing.html

  # Index
  root 'home#index'

  post '/locale', to: 'locale#update'

  ####################################
  # http://age.s22.xrea.com/talk2ch/ #
  ####################################

  scope format: true, constraints: { format: 'html' } do
    get '/bbsmenu', to: 'board#bbsmenu'
  end

  get '/:board_name', to: 'board#show'

  scope format: true, constraints: { format: 'txt' } do
    get '/:board_name/subject', to: 'board#subject'
    get '/:board_name/head', to: 'board#head'
  end

  scope format: true, constraints: { format: 'dat' } do
    get '/:board_name/dat/:th_id', to: 'th#dat'
  end

  get '/:board_name/:th_id', to: 'th#show'

  scope format: true, constraints: { format: 'cgi' } do
    post '/test/bbs', to: 'comment#create'
    # post "/test/read", to: "comment"
    # post "/test/subbbs", to: "comment#pre_post"
  end

  # post "/test/read.cgi/:board_name/:th_id", to: "th#show"
  # post "/test/read.cgi/:board_name/:th_id/:option", to: "th#show"
end
