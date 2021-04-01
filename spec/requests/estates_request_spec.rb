require 'rails_helper'

RSpec.describe "Estates", type: :request do
  describe 'GET #index' do
    before do
      get users_estates_path
    end

    it 'is expected to assign estate instance variable' do
      expect(assigns[:estate]).to eq(Estate.all)
    end
  end

  describe 'GET #new' do
    before do
      get new_user_estate_path
    end

    it 'is expected to assign estate as new instance variable' do
      expect(assigns[:estate]).to be_instance_of(Estate)
    end

    it 'renders new template' do
      is_expected.to render_template(:new)
    end

    it 'renders application layout' do
      is_expected.to render_template(:application)
    end
  end

  describe 'POST #create' do
    before do
      post user_estates_path, params: params
    end

    context 'when params are correct' do
      let(:params) { { estate: { name: "ani", address: "apna-ghar", area: "1200", bedroom: "3", hall: "1", kitchen: "1", park: "1" } } }

      it 'is expected to create new estate successfully' do
        expect(assigns[:estate]).to be_instance_of(Estate)
      end

      it 'is expected to redirect to estates path' do
        is_expected.to redirect_to user_estates_path
      end

      it 'is expected to set flash message' do
        expect(flash[:notice]).to eq('Saved successfully')
      end
    end

    context 'when params are not correct' do
      let(:params) { { estate: { name: '', address: '', area: '', bedroom: '', hall: '', kitchen: '', park: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end

      it 'is expected to add errors to name attribute' do
        expect(assigns[:estate].errors[:name]).to eq(['can\'t be blank'])
      end

      it 'is expected to add errors to address attribute' do
        expect(assigns[:estate].errors[:address]).to eq(['can\'t be blank', "is not a number"])
      end
    end
  end

  describe 'GET #edit' do
    before do
      get edit_user_estate_path(params)
    end

    context 'when estate id is valid' do
      let(:estate) { Estate.create(name: "ani", address: "apna-ghar", area: "1200", bedroom: "3", hall: "1", kitchen: "1", park: "1")  }
      let(:params) { { id: estate.id } }

      it 'is expected to set estate instance variable' do
        expect(assigns[:estate]).to eq(Estate.find_by(id: params[:id]))
      end

      it 'is expected to render edit template' do
        is_expected.to render_template(:edit)
      end
    end

    context 'when estate id is invalid' do
      let(:params) { { id: 200 } }

      it 'is expected to redirect_to users path' do
        is_expected.to redirect_to(user_estates_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('Data not found')
      end
    end

  end

  describe 'PATCH #update' do
    before do
      estate = Estate.create(name: "ani", address: "apna-ghar", area: "1200", bedroom: "3", hall: "1", kitchen: "1", park: "1" )
      patch user_estates_path(estate.id), params: params
    end

    context 'when estate exist in database' do
      let(:estate) { Estate.create(name: "a", address: "apna-ghar", area: "1200", bedroom: "3", hall: "1", kitchen: "1", park: "1") }
      let(:params) { { id: exercise.id, exercise: { name: "ani", address: "apna-ghar", area: "1200", bedroom: "3", hall: "1", kitchen: "1", park: "1" } } }

      context 'when data is provided is valid' do
        it 'is expected to update estate' do
          expect(estate.reload.name).to eq('a')
        end

        it 'is expected to update estate' do
          expect(exercise.reload.address).to eq('apna-ghar')
        end
        it 'is expected to update estate' do
          expect(exercise.reload.area).to eq('1200')
        end
        it 'is expected to update estate' do
          expect(exercise.reload.bedroom).to eq('3')
        end
        it 'is expected to update estate' do
          expect(exercise.reload.hall).to eq('1')
        end
        it 'is expected to update estate' do
          expect(exercise.reload.kitchen).to eq('1')
        end
        it 'is expected to update estate' do
          expect(exercise.reload.park).to eq('1')
        end

        it 'is_expected to redirect_to estate' do
          is_expected.to redirect_to(user_esates_path)
        end

        it 'is expected to set flash message' do
          expect(flash[:notice]).to eq('Estate Updated Successfully')
        end
      end

      context 'when data is invalid' do
        let(:estate) { Estate.create(name: nil, address: "apna-ghar", area: "1200", bedroom: "3", hall: "1", kitchen: "1", park: "1") }
        let(:params) { { id: estate.id, exercise: { name: '', address: '', area: '', bedroom: '', hall: '', kitchen: '', park: '' } } }

        it 'is expected to render edit template' do
          expect(response).to render_template(:edit)
        end

        it 'is expected to add errors to estate name attribute' do
          expect(assigns[:estate].errors[:name]).to eq(["can't be blank"])
        end

        it 'is expected to add errors to user address attribute' do
          expect(assigns[:estate].errors[:address]).to eq(["can't be blank"])
        end

        it 'is expected to add errors to estate area attribute' do
          expect(assigns[:estate].errors[:area]).to eq(["can't be blank"])
        end

        it 'is expected to add errors to estate bedroom attribute' do
          expect(assigns[:estate].errors[:bedroom]).to eq(["can't be blank"])
        end

        it 'is expected to add errors to estate hall attribute' do
          expect(assigns[:estate].errors[:hall]).to eq(["can't be blank"])
        end

        it 'is expected to add errors to estate name attribute' do
          expect(assigns[:estate].errors[:kitchen]).to eq(["can't be blank"])
        end

        it 'is expected to add errors to estate name attribute' do
          expect(assigns[:estate].errors[:park]).to eq(["can't be blank"])
        end
      end
    end
  end

  describe 'Delete #destroy' do
    before do
      estate = Estate.create(name: "ani", address: "apna-ghar", area: "1200", bedroom: "3", hall: "1", kitchen: "1", park: "1")
      delete user_estate_path(estate.id)
    end

    it 'is expected to delete estate record' do
      is_expected.to redirect_to(user_estates_path)
    end
  end
end
