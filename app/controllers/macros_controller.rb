class MacrosController < ApplicationController
  before_action :set_prep

  def index
    @macros = @prep.macros.order(created_at: :desc)
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
