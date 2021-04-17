class PeliculaController < ApplicationController
    #before_action :show, only: [:edit, :update]
    def index
        @lista_peliculas= Pelicula.all
    end    

    def new
        
    end
      
    def crear
        @pelicula = Pelicula.new(parametros_peliculas)

        if @pelicula.save
            redirect_to peliculas_path, notice: "Pelicula Guardada"
        else
            render 'new'
        end      
    end
    def eliminar
        @pelicula = encontrar_pelicula

        if @pelicula.destroy
            redirect_to peliculas_path, notice: "Eliminado Correctamente"
        else
            redirect_to peliculas_path, notice: "Error"
        end
    end 
   def edit
    @pelicula= Pelicula.find(params[:id])
    render :edit 
   end 
    def update
        @pelicula = Pelicula.find(params[:id])
        if @pelicula.update(peliculas_params)
          redirect_to peliculas_path, notice: "Pelicula Actualizada"
        else
          render :edit
        end
      end
      def show
        
    @pelicula= Pelicula.find(params[:id])
  
     end 
   private 
   
     def parametros_peliculas
       params.permit(:titulo, :director, :actores, :anyo, :premios, :duracion, :pais, :puntuacion, :imagen) 
     end
     def peliculas_params
        params.fetch(:pelicula, {}).permit(:id, :titulo, :director, :actores, :anyo, :premios, :duracion, :pais, :puntuacion, :imagen) 
      end
     def encontrar_pelicula
        @pelicula = Pelicula.find(params[:id])
     end   
    
      
   end
