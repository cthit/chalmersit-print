Rails.application.routes.draw do
  get 'list' => 'print#list_printers', as: :list
  post 'print' => 'print#create', as: :prints
  post 'pq' => 'print#pq', as: :pq_print
end
