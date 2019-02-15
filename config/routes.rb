Rails.application.routes.draw do
	post 'throw' => 'plays#throw'
  root 'plays#new'
end
