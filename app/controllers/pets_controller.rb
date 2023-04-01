class PetsController < ApplicationController
def index
      @pets = current_user.pets
    end
  
    def index
      if params[:user_id]
        user=User.find(params[:user_id])
        pet=user.pets
        render json: pet
      end
    end
      def show
        if params[:user_id]
          user=User.find(params[:user_id])
          pet=user.pets
          pet_ID=pet.find(params[:id])
          render json: pet_ID
        end
      end

    def destroy
      if params[:user_id]
        user=User.find(params[:user_id])
        pet=user.pets
        pet_ID=pet.find(params[:id])
        pet_ID.destroy
      end
      end
    def update
      if params[:user_id]
        user=User.find(params[:user_id])
        pet=user.pets
        pet_ID=pet.find(params[:id])
        pet_ID.update(pet_params)
        render json: pet_ID
      end

    end

  def create
  user = User.find(params[:user_id])
  pet = user.pets.create(pet_params)

  if pet.save
    render json: pet, status: :created
  else
    render json: pet.errors, status: :unprocessable_entity
  end
end

  
    private
  
    def pet_params
      params.permit(:name, :species, :breed, :age)
    end
  end
  