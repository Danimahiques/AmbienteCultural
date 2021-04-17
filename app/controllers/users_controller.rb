
class UsersController < ApplicationController

  def index
    @lista_users= User.all
  end

  def eliminar
    @users = encontrar_usuario

    if @users.destroy
        redirect_to users_path, notice: "Eliminado Correctamente"
    else
        redirect_to users_path, notice: "Error"
    end
    end
    
    private 
    def encontrar_usuario
        @usuarios = Usuario.find(params[:id])
     end   
end  