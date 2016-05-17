class MacrosController < ApplicationController
  before_action :require_user
  before_action :set_prep
  before_action :user_owns_prep

  def index
    @macros = @prep.macros.order(created_at: :desc)
    if @macros.length > 10
      @over_ten = true
      @chart_macros = @macros[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @chart_macros = @prep.macros.order(created_at: :desc)
    end
    @target_macros = @prep.target_macros.order(created_at: :desc)
    if @target_macros.length > 10
      @over_ten = true
      @chart_target_macros = @target_macros[-10..-1]
    end
    if params[:tm]
      @over_ten = false
      @chart_target_macros = @prep.target_macros.order(created_at: :desc)
    end
    @minmax = (@macros.map { |macro| macro.calories } + @target_macros.map { |macro| macro.calories }).minmax
  end

  def new
    @macro = Macro.new
  end

  def create
    @macro = Macro.new(macro_params)
    @macro.prep = @prep
    if @macro.save
      flash[:success] = "Macros entered"
      redirect_to prep_path(@prep)
    else
      render :new
    end
  end

  private

  def macro_params
    params.require(:macro).permit(:protein, :carbs, :fat, :fiber)
  end

end
