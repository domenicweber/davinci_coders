class CarsController < ApplicationController
  def index
  @car = Car.all
  end

  def new
  @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html {redirect_to root_path, notice: "#{@car.year} #{@car.make} #{@car.model} $#{@car.price} has been created"}
      else
        format.html { render :new }
      end
    end
    # create_message = "#{@car.year} #{@car.make} #{@car.model} #{@car.price} has been created"
    # redirect_to root_path,
    #   notice: create_message
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end

def table

end


# def create
#   @student = Student.new(student_params)
#
#   respond_to do |format|
#     if @student.save
#       format.html { redirect_to @student, notice: 'Student was successfully created.' }
#       format.json { render :show, status: :created, location: @student }
#     else
#       format.html { render :new }
#       format.json { render json: @student.errors, status: :unprocessable_entity }
#     end
#   end
# end
