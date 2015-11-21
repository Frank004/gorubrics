class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  before_action :set_organization, only: [:new,:create,:index]
  # GET /categories
  # GET /categories.json
  def index
    @categories = @organization.categories
  end

  # GET /categories/new
  def new
    @category = @organization.categories.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @organization.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to organization_categories_url(@organization), notice: 'Category was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to organization_categories_url(@organization), notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to organization_categories_url(@organization), notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
      @organization = @category.organization
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :organization_id)
    end
end
