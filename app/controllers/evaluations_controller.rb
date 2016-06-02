class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new,:create,:index]
  before_action :set_organization, only: [:new,:create,:index]
  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = @event.evaluations
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = @event.evaluations.new(
    evaluation_builder_id: params[:evaluation_builder_id],
    participant_id: params[:participant_id])
    @evaluation.points.build
    @evaluation_builder = EvaluationBuilder.find(params[:evaluation_builder_id])
    @participant = Participant.find(params[:participant_id])
   end

  # GET /evaluations/1/edit
  def edit
    @evaluation_builder= @evaluation.evaluation_builder
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = @event.evaluations.new(evaluation_params)
    @evaluation.organization_id = @event.organization.id
    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully created.' }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1
  # PATCH/PUT /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: 'Evaluation was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to event_evaluations_url(@event), notice: 'Evaluation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
      @event = @evaluation.event
      @organization = @evaluation.organization
    end
    def set_organization
      @organization = @event.organization
    end  
    def set_event
      @event = Event.find(params[:event_id])
    end   
    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_params
      params.require(:evaluation).permit(:note, :total_score, :participant_id,
        :member_id, :evaluation_builder_id, :event_id, :organization_id,
        evaluation_builder_attributes: [:id,:name], criterions_attributes: [:id,:name],
        points_attributes: [:id,:criterion_value,:criterion_id,:event_id,:organization_id])
    end
end
