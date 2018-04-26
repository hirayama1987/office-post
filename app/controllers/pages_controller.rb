class PagesController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses
  
  def show_all
    @questions = Question.where.not(status_id: 1).order('id DESC')
    @statuses = Status.all
  end
  
  def new
    @question = Question.new
  end
  
    # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :answer, :status_id)
    end
    
    def set_statuses
      @statuses = Status.all
    end
end
