Rails.application.routes.draw do
  get 'print' => 'print#new', as: :new_print
  post 'print' => 'print#create', as: :prints
  post 'pq' => 'print#pq', as: :pq_print

  root 'print#new'
end
