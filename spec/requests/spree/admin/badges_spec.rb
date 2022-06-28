require 'rails_helper'
include ControllerMacros
describe Spree::Admin::BadgesController,type: :controller do
  login_admin
  stub_authorization!
  let(:valid_attributes) do
    {
      'id' => '1',
      'name' => 'new_badge'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'name' => ''
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      badge = Spree::Badge.new(valid_attributes)
      badge.save
      get :index
      expect(response).to be_successful
    end
  end


  describe 'GET /edit' do
    it 'renders a successful response' do
      badge = Spree::Badge.new(valid_attributes)
      badge.save
      get :edit, params: { id: badge.id }
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'does creates a Badge' do
        expect do
          post :create, params: { badge: valid_attributes }
        end.to change(Spree::Badge, :count).by(1)
      end

      it 'redirects to the Badges index' do
        post :create, params: { badge: valid_attributes }
        expect(response).to redirect_to(admin_badges_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a Badge' do
        expect do
          post :create, params: { badge: invalid_attributes }
        end.to change(Spree::Badge, :count).by(0)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          'name' => 'edited'
        }
      end

      it 'updates the requested Badge' do
        badge = Spree::Badge.new(valid_attributes)
        badge.save
        patch :update, params: { id: badge.id, badge: new_attributes }
        badge.reload
        expect(response).to be_redirect
      end

      it 'redirects to the Badge index' do
        badge = Spree::Badge.new(valid_attributes)
        badge.save
        patch :update, params: { id: badge.id, badge: new_attributes }
        badge.reload
        expect(response).to redirect_to(admin_badges_path)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested post' do
      badge = Spree::Badge.new(valid_attributes)
      badge.save
      expect do
        delete :destroy, params: { id: badge.id }
      end.to change(Spree::Badge, :count).by(-1)
    end

    it 'redirects to the posts list' do
      badge = Spree::Badge.new(valid_attributes)
      badge.save
      delete :destroy, params: { id: badge.id }
      expect(response).to redirect_to(admin_badges_path)
    end
  end
end
