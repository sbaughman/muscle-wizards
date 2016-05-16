module MacrosHelper

  def check_macro_params
    if params[:m]
      "?m=all?&tm=all"
    elsif params[:tm]
      "?m=all?&tm=all"
    else
      nil
    end  
  end

end
