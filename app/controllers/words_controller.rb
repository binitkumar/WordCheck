class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  def test
    @page = params[:page].nil? ? 1 : params[:page].to_i
    @question = Word.question_set(@page)

    seq_count = current_user.user_responses.count
    correct_count = current_user.user_responses.where(answered_correctly: true).count

    @seq_per = (( seq_count.to_f / 10.to_f ) * 100 ).to_i
    @correct_per = current_user.user_responses.count != 0 ? (( correct_count.to_f / seq_count.to_f ) * 100 ).to_i : 0
  end

  def answer
    question = params[:question]
    answer   = params[:answer]
    page     = params[:page].to_i

    word = Word.find_by_word_str question
    correct_answer = word.mark_answer(answer)

    user_resp = UserResponse.create(
      user_id: current_user.id,
      word_id: word.id,
      answered_correctly: correct_answer 
    )    

    #@mastered = word.user_responses.where(answered_correctly: true, user_id: current_user.id).count > 2
    if current_user.user_responses.count < 10
      redirect_to "/words/test?page=#{page + 1}"
    else
      redirect_to "/words/answer_sheet"
    end
  end

  def answer_sheet
     @answers = current_user.user_responses
  end

  # GET /words/1
  # GET /words/1.json
  def show
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { render :show, status: :ok, location: @word }
      else
        format.html { render :edit }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url, notice: 'Word was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_params
      params.require(:word).permit(:word_str, :num_tested, :num_correct, :num_correct_seq, :num_wrong, :first_tested, :last_tested)
    end
end
