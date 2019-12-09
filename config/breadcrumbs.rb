crumb :root do
  link 'ホーム', root_path
end

crumb :users_show do
  link "マイページ", show_user_path(user_id: session[:user_id])
  parent :root
end

crumb :users_profile do
  link "プロフィール"
  parent :users_show
end