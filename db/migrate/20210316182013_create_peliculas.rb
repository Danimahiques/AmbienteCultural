class CreatePeliculas < ActiveRecord::Migration[5.2]
  def change
    create_table :peliculas do |t|
      t.string :titulo
      t.string :director
      t.string :actores
      t.string :año
      t.string :premios
      t.string :duracion
      t.string :pais
      t.integer :puntuacion
      t.longblob :imagen

      t.timestamps
    end
  end
end
