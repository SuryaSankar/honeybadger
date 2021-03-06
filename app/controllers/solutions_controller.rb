class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]
  before_action :store_location, except: [:index]
  before_action :authenticate_user!, except: [:index]

  # GET /solutions
  # GET /solutions.json
  def index
    @solutions = Solution.all
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
	@show_left_navigation=false
	@question=@solution.question
  end

  # GET /solutions/new
  def new
    @solution = Solution.new
  end

  # GET /solutions/1/edit
  def edit
	@show_left_navigation=false
	@question=@solution.question
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = Solution.new(solution_params)

    respond_to do |format|
      if @solution.save
        format.html { redirect_to @solution, notice: 'Solution was successfully created.' }
        format.json { render action: 'show', status: :created, location: @solution }
      else
        format.html { render action: 'new' }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  def yoursolutions
    @solutions=Solution.where(user_id: current_user.id).order('created_at DESC') 
    puts @solutions 
    render 'index'
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to @solution, notice: 'Solution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    question_id=@solution.question_id
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to question_path(question_id) }
      format.json { head :no_content }
    end
  end


  def accept
	AcceptedSolution.create user_id: current_user.id, solution_id: params[:solution_id], accept: true
	render text: AcceptedSolution.where(solution_id: params[:solution_id], accept: true).count
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:id, :answer)
    end
end
