class LibrosController < ApplicationController
    def index
        @lista_libros= Libro.all
    end    

    def new
        
    end
      
    def crear
        @libro = Libro.new(parametros_libros)

        if @libro.save
            redirect_to libros_path, notice: "Libro Guardado"
        else
            render 'new'
        end      
    end
    def eliminar
        @libro = encontrar_libro

        if @libro.destroy
            redirect_to libros_path, notice: "Eliminado Correctamente"
        else
            redirect_to libros_path, notice: "Error"
        end
    end 
    def edit
        @libro= Libro.find(params[:id])
        render :edit 
       end 
        def update
            @libro = Libro.find(params[:id])
            if @libro.update(libros_params)
              redirect_to libros_path, notice: "Libro Actualizado"
            else
              render :edit
            end
          end
          def show
            
        @libro= Libro.find(params[:id])
      
         end    
   private 
   
     def parametros_libros
       params.permit(:titulo, :genero, :paginas, :autor, :puntuacion, :editorial, :anyo) 
     end
     def libros_params
        params.fetch(:libro, {}).permit(:titulo, :genero, :paginas, :autor, :puntuacion, :editorial, :anyo) 
      end
     def encontrar_libro
        @libros = Libro.find(params[:id])
     end   
    
      
end
