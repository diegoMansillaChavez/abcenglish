class StudentSessionsController < ApplicationController
  def new
    @student = Student.new
  end

  def create

   #if @student=login(params[:username], params[:paswword])
    #  redirect_back_or_to(student_card_path, message: "login exitoso")
    #else
     # flash.now[:alert]= "algo salio mal"
    #end

    #render :text => params[:password].inspect
    #@studentx= Student.find(params[:user_name])
    #@studentx= Student.find_by(user_name: params[:user_name],password: params[:password]) error por la encripatacion
    @studentx= Student.find_by(user_name: params[:user_name],password: params[:password])
    if @studentx != nil
     #render :text => 'vista dashboard'
      redirect_to :controller =>"students" , :action =>"dashboard"
    else
      @student_cards = StudentCard.find_by(user_name: params[:user_name],password: params[:password])
      if @student_cards!=nil


        ###desde aqui chato
        #render :text => 'registrese por favor '
        #redirect_to :controller =>"students" , :action =>"new"
        redirect_to :controller =>"registrations" , :action =>"new"
      end
    end

  end

  def destroy
    logout
    #redirect_to (student_cards_url, message: "logged out")
  end

  def dashboard
    
  end

  private
  def student_params
    params.require(:student).permit(:name, :last_name,:user_name, :email, :password, :password_confirmation, :current_password, :image)
  end
end