require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '.create' do
    context 'When logged in' do
      let(:user) { create(:user) }
      let(:article) { Article.last }

      before do
        sign_in(user)
        post :create, params: {
          article: {
            title: 'Testing Articles', body: 'This is a article for testing', status: 'public', user_id: user.id
          }
        }
      end

      it { expect(Article.last.body).to eq('This is a article for testing') }

      it { expect(Article.count).to eq(1) }

      it { is_expected.to redirect_to(article) }
    end

    context 'When not logged in' do
      let(:user) { create(:user) }
      let(:article) { Article.last }

      before do
        post :create, params: {
          article: {
            title: 'Testing Articles', body: 'This is a article for testing', status: 'public', user_id: user.id
          }
        }
      end

      it { expect(Article.count).to eq(0) }
      it { is_expected.to redirect_to(user_session_url) }
    end
  end

  describe '.show' do
    context 'When logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        sign_in(user)
        get :show, params: { id: article.id }
      end

      it { expect(response).to have_http_status(:success) }
    end

    context 'When not logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        get :show, params: { id: article.id }
      end

      it { expect(response).to have_http_status(:redirect) }
      it { is_expected.to redirect_to(user_session_url) }
    end
  end

  describe '.index' do
    context 'When logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        sign_in(user)
        get :index
      end

      it { expect(response).to have_http_status(:success) }
    end

    context 'When not logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        get :index
      end

      it { expect(response).to have_http_status(:redirect) }
      it { is_expected.to redirect_to(user_session_url) }
    end
  end

  describe '.update' do
    context 'When logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        sign_in(user)
        patch :update, params: { id: article.id, article: {
          title: 'Testing Articles', body: 'This is a article for testing', status: 'public', user_id: user.id
        } }
      end

      it { expect(Article.last.body).to eq('This is a article for testing') }

      it { is_expected.to redirect_to(article) }
      it { expect(response).to have_http_status(:redirect) }
    end

    context 'When not logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        patch :update, params: { id: article.id, article: {
          title: 'Testing Articles', body: 'This is a article for testing', status: 'public', user_id: user.id
        } }
      end

      it { expect(response).to have_http_status(:redirect) }
      it { is_expected.to redirect_to(user_session_url) }
    end
  end

  describe '.destroy' do
    context 'When logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        sign_in(user)
        delete :destroy, params: { id: article.id }
      end

      it { expect(Article.count).to eq(0) }
      it { is_expected.to redirect_to(root_path) }
    end

    context 'When not logged in' do
      let(:user) { create(:user) }
      let(:article) { create(:article, user: user) }

      before do
        delete :destroy, params: { id: article.id }
      end

      it { expect(Article.count).to eq(1) }
      it { is_expected.to redirect_to(user_session_url) }
    end
  end
end
