class NotesController < ApplicationController
  def index
    @notes = current_user.notes
  end

  def show
    @note = Notes.find_by(params[:id])
  end


  def new
  end

  def create
  end

  def destroy
  end

  private

    def notes_params
      params.require(:note).permit(:content)
    end

end
