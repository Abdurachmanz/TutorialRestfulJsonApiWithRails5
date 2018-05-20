class CitrakarasController < ApplicationController
  before_action :set_citrakara, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @citrakaras = current_user.citrakaras
    json_response(@citrakaras)
  end

  # POST /todos
  def create
    @citrakara = current_user.citrakaras.create!(citrakara_params)
    json_response(@citrakara, :created)
  end

  # GET /todos/:id
  def show
    json_response(@citrakara)
  end

  # PUT /todos/:id
  def update
    @citrakara.update(citrakara_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @citrakara.destroy
    head :no_content
  end

  private

  def citrakara_params
    # whitelist params
    params.permit(:title)
  end

  def set_citrakara
    @citrakara = Citrakara.find(params[:id])
  end
end
