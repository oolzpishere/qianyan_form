require 'rails_helper'

# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ResultsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Result. As you add validations to Result, be sure to
  # adjust the attributes here as well.

  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResultsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    before(:example) do
      result1 = create(:primary_english_result)
      result2 = create(:primary_english_result)
      # post :create, :params => attr1, :format => :json
      # post :create, :params => attr2, :format => :json
    end


    it "returns a success response" do
      # result = Result.create! valid_attributes
      get :index, params: {subject: "PrimaryEnglishResult"}, session: valid_session
      expect(response).to be_success
    end

    it "index get all instances" do
      get :index, params: {subject: "PrimaryEnglishResult"}
      expect(assigns(:openid_results).count).to eq(2)
    end
  end

  describe "GET #show" do
    before(:example) do
      subject_class =  "primary_english_result"
      create(:primary_english_result)
      @result = subject_class.camelize.constantize.order(id: :desc).first
    end

    it "returns a success response" do
      # result = Result.create! valid_attributes
      get :show, params: {subject: "PrimaryEnglishResult", id: @result.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  # describe "GET #new" do
  #   xit "returns a success response" do
  #     get :new, params: {}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  # describe "GET #edit" do
  #   xit "returns a success response" do
  #     result = Result.create! valid_attributes
  #     get :edit, params: {id: result.to_param}, session: valid_session
  #     expect(response).to be_success
  #   end
  # end

  describe "POST #create" do
    context "with valid params" do
      it "create success with pass and subject" do
        extra = {subject: "PrimaryEnglishResult", pass:  ENV["QIANYAN_FORM_PASS"] }
        attr = attributes_for(:primary_english_result).merge(extra)
        # post :create, :params => attr, :format => :json
        expect { post :create, :params => attr, :format => :json }.to change { PrimaryEnglishResult.count }.by(1)
      end

      # xit "creates a new Result" do
      #   expect {
      #     post :create, params: {result: valid_attributes}, session: valid_session
      #   }.to change(Result, :count).by(1)
      # end

      # xit "redirects to the created result" do
      #   post :create, params: {result: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(Result.last)
      # end
    end

    context "with invalid params" do
      # xit "returns a success response (i.e. to display the 'new' template)" do
      #   post :create, params: {result: invalid_attributes}, session: valid_session
      #   expect(response).to be_success
      # end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     xit "updates the requested result" do
  #       result = Result.create! valid_attributes
  #       put :update, params: {id: result.to_param, result: new_attributes}, session: valid_session
  #       result.reload
  #       skip("Add assertions for updated state")
  #     end

  #     xit "redirects to the result" do
  #       result = Result.create! valid_attributes
  #       put :update, params: {id: result.to_param, result: valid_attributes}, session: valid_session
  #       expect(response).to redirect_to(result)
  #     end
  #   end

  #   context "with invalid params" do
  #     xit "returns a success response (i.e. to display the 'edit' template)" do
  #       result = Result.create! valid_attributes
  #       put :update, params: {id: result.to_param, result: invalid_attributes}, session: valid_session
  #       expect(response).to be_success
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   xit "destroys the requested result" do
  #     result = Result.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: result.to_param}, session: valid_session
  #     }.to change(Result, :count).by(-1)
  #   end

  #   xit "redirects to the results list" do
  #     result = Result.create! valid_attributes
  #     delete :destroy, params: {id: result.to_param}, session: valid_session
  #     expect(response).to redirect_to(results_url)
  #   end
  # end

end
