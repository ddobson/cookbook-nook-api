# frozen_string_literal: true
# :nodoc:
class CookbooksController < OpenReadController
  before_action :set_cookbook, only: [:show, :update, :destroy]

  # GET /cookbooks
  def index
    @cookbooks = current_user.cookbooks.all

    render json: @cookbooks
  end

  # GET /cookbooks/1
  def show
    if @cookbook
      render json: @cookbook
    else
      head status: :not_found
    end
  end

  # POST /cookbooks
  def create
    @cookbook = current_user.cookbooks.build(cookbook_params)

    if @cookbook.save
      render json: @cookbook, status: :created
    else
      render json: @cookbook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cookbooks/1
  def update
    if @cookbook.update(cookbook_params)
      render json: @cookbook
    else
      render json: @cookbook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cookbooks/1
  def destroy
    @cookbook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookbook
      @cookbook = current_user.cookbooks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cookbook_params
      params.require(:cookbook).permit(:title, :start_page, :end_page)
    end
end
