class PeoplesController < ApplicationController

  def index
    @peoples = Person.all
  end

  def show
    @peoples = Person.find(params[:id])
  end

  def person
    @peoples = Person.all
  end

  def librarian
    @librarians = Librarian.all
  end

  def student
    @students = Student.all
  end

  def new
    @peoples = Person.new
  end

  def create

    @peoples = Person.new(per_params)
    if @peoples.save
      BackgroundJobsJob.perform_later(@peoples.id)
       # BackgroundJobsJob.set(wait: 1.minute).perform_later(@peoples.id)
      redirect_to person_peoples_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @peoples = Person.find(params[:id])
  end

  def update
    @peoples = Person.find(params[:id])
  

    if @peoples.update(per_params)
      redirect_to person_peoples_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @peoples = Person.find(params[:id])
    @peoples.destroy

    redirect_to root_path, status: :see_other
  end


  private
    def per_params
      params.require(:person).permit(:name, :surname, :email,:profile_image)
    end
end

 