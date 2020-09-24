RSpec.describe UsersController, type: :controller do
   describe 'create' do
    it 'successfully creates a new user' do
      expect{
          post :create, params: { :user => { :username => "testuser", :password => "asdf", :id => 2 } }
        }.to change(User,:count).by(1)
      end
    end
  end