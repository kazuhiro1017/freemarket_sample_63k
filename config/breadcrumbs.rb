crumb :root do
  link 'ホーム', root_path
end

crumb :users_show do
  link "マイページ", user_path(id: session[:user_id])
  parent :root
end

crumb :users_profile do
  link "プロフィール"
  parent :users_show
end

crumb :users_signout do
  link "ログアウト"
  parent :users_show
end

crumb :users_card do
  link "支払い方法"
  parent :users_show
end

crumb :users_identification do
  link "本人情報ページ"
  parent :users_show
end

crumb :items_show do
  item = Item.find_by(id: params[:id])
  link "#{item.name}"
  parent :root
end

crumb :creditcard_card do
  link "支払い方法"
  parent :users_show
end