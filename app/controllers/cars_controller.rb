class CarsController < ApplicationController
  def index
  @cars = Car.all
  end

  def show

  end

  def new
  @cars = Car.new
  end

  def create
    @cars = Car.new(car_params)

    respond_to do |format|
      if @cars.save
        format.html {redirect_to root_path, notice: "#{@cars.year} #{@cars.make} #{@cars.model} has been created"}
      else
        format.html { render :new }
      end
    end
    # create_message = "#{@car.year} #{@car.make} #{@car.model} #{@car.price} has been created"
    # redirect_to root_path,
    #   notice: create_message
  end

  def edit
    @cars = Car.find(params[:id])
  end

  def update
     @car = Car.find(params[:id])
     @car.update(car_params)

       update_message = "#{@car.year} #{@car.make} #{@car.model} has been updated"
       redirect_to root_path,
       notice: update_message
     end
  #   # create_message = "#{@car.year} #{@car.make} #{@car.model} #{@car.price} has been created"
  #   # redirect_to root_path,
  #   #   notice: create_message
   end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end



# GET /cars/1/edit


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
