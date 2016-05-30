class NotesController < ApplicationController
  def index
    @notes = current_user.notes.order(created_at: :desc ).paginate(page: params[:page], per_page: 10)
    @note_formatted = AutoHtml::Link.new(target: '_blank')
  end

  def show
    @note = Note.find_by(id: params[:id])
  end


  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.new(notes_params)
    @note.content = @note.content.strip
    if @note.save
      flash[:success] = "Note Saved!"
      redirect_to notes_path
    else
      render 'new'
    end
  end

  def destroy
    note = Note.find_by(id: params[:id])
    # do stuff
    if note.destroy
      flash[:notice] = "Successfully deleted note"
    else
      flash[:danger] = "Error deleting note. Please contact web admin on 'About' page"
    end
    redirect_to notes_path
  end

  private

    def notes_params
      params.require(:note).permit(:content)
    end

end
