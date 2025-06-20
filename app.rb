require 'sinatra'
require 'roo'

set :public_folder, 'public'

def cargar_desde_excel(tipo)
  ruta = "./data/#{tipo}.xlsx"
  xlsx = Roo::Excelx.new(ruta)

  case tipo
  when "aplausos"
    xlsx.drop(1).map do |row|
      {
        nombre: row[0],
        descripcion: row[1],
        link_video: row[2],
        imagen: row[3]
      }
    end
  when "dinamicas"
    xlsx.drop(1).map do |row|
      {
        nombre: row[0],
        descripcion: row[1],
        link_video: row[2],
        imagen: row[3]
      }
    end
  when "juegos"
    xlsx.drop(1).map do |row|
      {
        nombre: row[0],
        objetivo: row[1],
        imagen: row[2]
      }
    end
  else
    []
  end
end

get '/' do
  erb :index
end

get '/bitacora/:tipo' do
  @tipo = params[:tipo]
  @items = cargar_desde_excel(@tipo)
  erb :bitacora
end


get '/reflexion' do
  erb :reflexion
end