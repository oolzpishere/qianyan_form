class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:show, :index, :create]
  before_action :authenticate, only: [:create], if: Proc.new { |c| c.request.format != 'application/json'}
  # before_action :json_create_restirct_access, only: [:create], if: Proc.new { |c| c.request.format = 'application/json'}
  before_action :subject_class, only: [:index, :show, :create]
  USERS = { ENV["QIANYAN_FORM_USER"] => ENV["QIANYAN_FORM_SE"] }
  wrap_parameters :result, include: [:id, :form, :form_name, :openid, :gen_code, :created_at, :updated_at,:entry]
  # GET /results
  # GET /results.json
  def index
    # constantize(type).order(id: :desc).all if subjects.include?(subject)
    @results = subject_class.order(id: :desc).all
    @openid_results = Rails.env.match(/production/) ? @results.select {|result| result.openid == session[:openid]} : @results
  end

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # GET /results/1/edit
  def edit
  end

  # POST /results
  # POST /results.json
  def create
    # like: http://localhost:3000/results?pass=ENV["QIANYAN_FORM_PASS"]
    unless params[:pass] == ENV["QIANYAN_FORM_PASS"]
      return render json: {'fail':'need pass'}.to_json, status: :bad_request
    end

    hash = {
      "id" => result_params.dig(:entry, :serial_number) ||  result_params[:id],
      "openid" => result_params.dig(:entry, :x_field_weixin_openid) || result_params[:openid],
      "gen_code" => result_params.dig(:entry, :gen_code) || result_params[:gen_code],
      "created_at" => result_params.dig(:entry, :created_at) || result_params[:created_at],
      "updated_at" => result_params.dig(:entry, :updated_at) || result_params[:updated_at]
    }

    # @result = Result.new(result_params.merge h)

    # subject_pluralize = subject.pluralize
    # @result = Result.find(subject).send(subject_pluralize).new(result_params.merge h)

    result_params_merged = result_params.merge hash
    if subject_class.exists?(hash["id"])
      @result = subject_class.find(hash["id"])
      respond_to do |format|
        if @result.update(result_params_merged)
          format.html { redirect_to @result, notice: 'Result was successfully updated.' }
          format.json { render json: "", status: :ok }
        else
          format.html { render :edit }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    else
      @result = subject_class.new(result_params_merged)
      respond_to do |format|
        if @result.save
          format.html { redirect_to @result, notice: 'Result was successfully created.' }
          format.json { render json: "", status: :ok }
        # format.json { render :show, status: :created, location: @result }
        else
          format.html { render :new }
          format.json { render json: @result.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /results/1
  # PATCH/PUT /results/1.json
  def update
    respond_to do |format|
      if @result.update(result_params)
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { render :show, status: :ok, location: @result }
      else
        format.html { render :edit }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_result
    # @result = Result.find(params[:id])
    @result = subject_class.find(params[:id])
  end

  def subject_class
      # subjects = %w(PrimaryChineseResult PrimaryEnglishCompetitionResult PrimaryEnglishResult PrimaryMathResult)
    if subject_names.include?(params[:subject])
      subject = params[:subject].camelize
      subject && subject.constantize
    end
  end

  def subject_names
    Rails.application.eager_load!
    ActiveRecord::Base.descendants.map(&:name)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def result_params
    # permit :openid, :gen_code for save it directly
    params.fetch(:result, {}).permit(:id, :form, :form_name, :openid, :gen_code, :created_at, :updated_at,:entry => {})
  end

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

  # def pass
  #   byebug
  #   # format.json { render json: "", status: :unprocessable_entity }
  #   return 1 unless params[:pass] == "6mVjeZGmWni4rrbWZy5kJynwsiLzKN5q"
  # end

end
