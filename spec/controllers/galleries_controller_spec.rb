require 'rails_helper'

RSpec.describe GalleriesController, type: :controller do
  describe "POST #create" do
    context "with valid params" do
      let(:params) do
        {
          gallery: { title: "MyTitle", description: "MyDesc", images_attributes: [{ picture_file_name: 'room-controller-valid.jpg' }] }
        }
      end
      subject { post :create, params }

      it "creates a new Gallery with new set of Images" do
        subject
        expect(response).to be_successful
      end
    end
  end
end