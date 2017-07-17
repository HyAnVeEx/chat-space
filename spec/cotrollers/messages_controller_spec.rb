require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group)}
  let(:message) { build(:message, user: user.id, group: group.id) }
  let(:params){ {message: attributes_for(:message), user: user.id, group_id: group.id} }
  let(:params_nil){ {message: attributes_for(:message, content: nil, image: nil), user: user.id, group_id: group.id} }

  context 'ログインしている場合'  do
    describe 'GET #index' do
      before do
        login_user user
      end
      it "変数は正しく呼び出されているか？" do
        @group = user.groups.first
        get :index, params: { group_id: @group.id }
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end
      it "indexページに推移するか？" do
        @group = user.groups.first
        get :index, params: { group_id: @group.id }
        expect(response).to render_template :index
      end
    end
  end

  context 'ログインしていない場合' do
    describe 'GET #index' do
      it "サインインページにリダイレクトされるか？" do
        @group = user.groups.first
        get :index, params: { group_id: @group.id }
        expect(response).to redirect_to('http://test.host/users/sign_in')
      end
    end
  end

  context 'ログインしている場合' do
    describe 'POST #create' do
      before do
        login_user user
      end

      it "メッセージの保存は出来たか？" do
        expect{
          post :create, params: params}.to change(Message, :count).by(1)
      end
      it "messageページにリダイレクトされたか？" do
        expect{
          post :create, params: params}.to change(Message, :count).by(1)
        expect(response).to redirect_to group_messages_path
      end
      it "メッセージの保存は行われなかったか？" do
        expect{
          post :create, params: params_nil}.to change(Message, :count).by(0)
      end
      it "messageページがrenderで読み込まれたか？" do
          expect{
          post :create, params: params_nil}.to change(Message, :count).by(0)
          expect(response).to render_template :index
      end
    end
  end

  context 'ログインしていない場合' do
    describe 'POST #create' do
      it "サインインページにリダイレクトされるか？" do
        expect{
          post :create, params: params}.to change(Message, :count).by(1)
        expect(response).to redirect_to('http://test.host/users/sign_in')
      end
    end
  end
end
