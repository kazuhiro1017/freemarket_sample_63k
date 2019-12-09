crumb :root do
  link 'ホーム', root_path
end

crumb :users_show do
  link "マイページ"
  parent :root
end

crumb :users_profile do
  link "プロフィール"
  parent :root
  parent :users_show
end