class ReportsController

  def indxe

  end

  def show

  end

  def create

  end

  def destroy

  end

  private

  def report_params
    params.require(:report).permit!
  end
end