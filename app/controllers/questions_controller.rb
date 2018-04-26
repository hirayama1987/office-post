class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_statuses
  before_action :authenticate_user, only: [:index, :show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all.order('status_id ASC')
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    path = Rails.application.routes.recognize_path(request.referer)
    
    respond_to do |format|
      
      if @question.save
        if(path[:controller]=="pages") then
                  format.html { redirect_to pages_show_all_path, notice: '要望を受けつけました。回答をお待ちください。' }
        end
          format.html { redirect_to @question, notice: 'Question was successfully created.' }
          format.json { render :show, status: :created, location: @question }
      else
        if(path[:controller]=="pages") then
          format.html { redirect_to pages_new_path, errors: @question.errors}
        end
          format.html { render :new }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        
        format.html { redirect_to questions_path, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
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
    
    def authenticate_user
      if !user_signed_in? then
        redirect_to new_user_session_path , notice: 'ログインしてください。'
      end
    end
end
