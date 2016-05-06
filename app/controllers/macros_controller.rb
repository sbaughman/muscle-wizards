class MacrosController < ApplicationController
  before_action :require_user
  before_action :set_prep

  def index
    @macros = @prep.macros.order(created_at: :desc)
    @target_macros = @prep.target_macros.order(created_at: :desc)
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
