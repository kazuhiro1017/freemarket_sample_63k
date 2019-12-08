# require 'rails_helper'

# RSpec.describe UsersController, type: :controller do
  
#   describe 'GET #login' do
#     it "renders the :login template" do
#       get :login
#       expect(response).to render_template :login
#     end
#   end

#   describe 'GET #new' do
#     it "renders the :new template" do
#       get :new
#       expect(response).to render_template :new
#     end
#   end

#   describe 'GET #user_add' do
#     it "renders the :user_add template" do
#       get :user_add
#       expect(response).to render_template :user_add
#     end
#   end

#   describe 'GET #phone_add' do
#     it "renders the :phone_add template" do
#       get :phone_add
#       expect(response).to render_template :phone_add
#     end
#   end

#   describe 'GET #address_add' do
#     it "renders the :address_add template" do
#       get :address_add
#       expect(response).to render_template :address_add
#     end
#   end

#   describe 'GET #card_add' do
#     it "renders the :card_add template" do
#       get :card_add
#       expect(response).to render_template :card_add
#     end
#   end

#   describe 'GET #complete' do
#     it "renders the :complete template" do
#       get :complete
#       expect(response).to render_template :complete
#     end
#   end

#   describe '#logging_in' do
#     let(:params) { { user: attributes_for(:user) } }

#     context 'user is valid' do
#       subject {
#         post :logging_in,
#         params: params
#       }

#       it "assigns the requested user to @user" do
#         # user = create(:user)
#         subject
#         expect(assigns(:user)). to eq user
#       end

#       it 'redirects to items_path' do
#         subject
#         expect(response).to redirect_to(items_path)
#       end
#     end
#   end


# end
