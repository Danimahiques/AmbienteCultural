class CreateLibros < ActiveRecord::Migration[5.2]
  def change
    create_table :libros do |t|
      t.string :titulo
      t.string :genero
      t.integer :paginas
      t.string :autor
      t.integer :puntuacion
      t.string :editorial
      t.string :anyo
      
      t.timestamps
    end
  end
end
