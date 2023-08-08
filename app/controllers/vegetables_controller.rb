class VegetablesController < ApplicationController
  def index
    render json: Vegetable.all.to_json, status: :ok
  end


  def show
    render json: Vegetable.find(params[:id]).to_json, status: :ok
  end

  # def new
  #   render json: Vegetable.new.to_json, status: :ok
  # end

  def create
    vegetable = Vegetable.new(vegetable_params)
    if vegetable.save
      # flash[:success] = "Vegetable saved successfully"
      # redirect_to vegetables_path
      render json: vegetable, status: :ok
    else
      # flash.now[:error] = "Error: Vegetable couldn't saved successfully"
      # redirect_to new_vegetable_path, locals: { vegetable: vegetable}
      render json: vegetable.errors, status: :unprocessable_entity
    end
  end

  def update
    vegetable = Vegetable.find(params[:id])
    vegetable.update(vegetable_params)
    render json: vegetable, status: :ok
  end

  def destroy
    vegetable = Vegetable.find(params[:id])
    vegetable.destroy!
    render json: "Address deleted successfully".to_json, status: :ok
  end

  private

  def vegetable_params
    params.require(:vegetable).permit(:name, :price, :available)
  end
end
