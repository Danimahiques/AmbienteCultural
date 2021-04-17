class UsuarioController < ApplicationController

    def index
        @lista_usuario= Usuario.all
    end    

    def new
        @usuario = Usuario.new(parametros_usuario)

        if @usuario.save
            redirect_to usuarios_path, notice: "Registrado correctamente"
        else
            render 'new'
        end  
    end
      
    def crear
        @usuario = Usuario.new(parametros_usuario)

        if @usuario.save
            redirect_to usuarios_path, notice: "Registrado correctamente"
        else
            render 'new'
        end        
    end
    def eliminar
        @usuarios = encontrar_usuario

        if @usuarios.destroy
            redirect_to usuarios_path, notice: "Eliminado Correctamente"
        else
            redirect_to usuarios_path, notice: "Error"
        end
    end    
   private 
   
     def parametros_usuario
       params.permit(:nombre, :apellido, :email, :nickname, :password_digest) 
     end
     
     def encontrar_usuario
        @usuarios = Usuario.find(params[:id])
     end   
   end
