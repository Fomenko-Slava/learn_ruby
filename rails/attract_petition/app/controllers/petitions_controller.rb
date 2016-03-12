class PetitionsController < ApplicationController

  before_filter :authorize, only: [:edit, :update, :destroy, :create, :new]

  def index
    @petitions = Petition.order(created_at: :desc).limit(10)
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def new
    @petition = Petition.new
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def create
    @petition = current_user.petitions.create(petition_params)
    if @petition.save
      redirect_to @petition
    else
      render 'new'
    end
  end

  def update
    @petition = Petition.find(params[:id])

    if @petition.update(petition_params)
      redirect_to @petition
    else
      render 'edit'
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    redirect_to petitions_path
  end

  def all
    @petitions = Petition.all
    @petitions = @petitions.where(user: current_user) if params[:my]
  end

  private
    def petition_params
      params.require(:petition).permit(:title, :description)
    end
end
