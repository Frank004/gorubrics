class EvaluationBuildersController < ApplicationController
  before_action :set_evaluation_builder, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new,:create,:index]
  before_action :set_organization, only: [:new,:create,:index]


  # GET /evaluation_builders
  # GET /evaluation_builders.json
  def index
    @evaluation_builders = @event.evaluation_builders
  end

  # GET /evaluation_builders/1
  # GET /evaluation_builders/1.json
  def show
  end

  # GET /evaluation_builders/new
  def new
    @evaluation_builder = @event.evaluation_builders.new
  end

  # GET /evaluation_builders/1/edit
  def edit
  end

  # POST /evaluation_builders
  # POST /evaluation_builders.json
  def create
    @evaluation_builder = @event.evaluation_builders.new(evaluation_builder_params)
    @evaluation_builder.organization_id = @event.organization_id
    respond_to do |format|
      if @evaluation_builder.save
        format.html { redirect_to @evaluation_builder, notice: 'Evaluation builder was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation_builder }
      else
        format.html { render :new }
        format.json { render json: @evaluation_builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluation_builders/1
  # PATCH/PUT /evaluation_builders/1.json
  def update
    respond_to do |format|
      if @evaluation_builder.update(evaluation_builder_params)
        format.html { redirect_to @evaluation_builder, notice: 'Evaluation builder was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation_builder }
      else
        format.html { render :edit }
        format.json { render json: @evaluation_builder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_builders/1
  # DELETE /evaluation_builders/1.json
  def destroy
    @evaluation_builder.destroy
    respond_to do |format|
      format.html { redirect_to event_evaluation_builders_url(@event), notice: 'Evaluation builder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation_builder
      @evaluation_builder = EvaluationBuilder.find(params[:id])
      @event = @evaluation_builder.event
      @organization = @evaluation_builder.organization
    end
    def set_event
      @event = Event.find(params[:event_id])
    end    
    def set_organization
      @organization = @event.organization
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_builder_params
      params.require(:evaluation_builder).permit(:name, :event_id, :organization_id, :category_id, criterions_attributes: [:name, :_destroy,:id])
    end
end
