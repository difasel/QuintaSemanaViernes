
require 'csv' 

class MaratonModulo

  attr_accessor :array_respuestas, :array_preguntas, :pregunta_info, :num_pre_res, :correctas
  attr_accessor :incorrectas, :salida_respuesta


  def initialize
    @file_name = "lista_preguntas.csv"
    @array_pre_res = []
    @correctas = 0
    @incorrectas = 0
    read_csv

  end

  def read_csv
    CSV.foreach(@file_name) do |row|
      @array_pre_res <<  PreguntaRespuesta.new(row[0])  
    end
     @num_pre_res =  (@array_pre_res.count+1) / 3
  end


  def preguntas(num_pre)
    @array_preguntas = []
    for pregunta in 0..@array_pre_res.count-1
      modulo = pregunta % 3
      if modulo == 0
        @array_preguntas << @array_pre_res[pregunta].pregunta_res
      end
    end
    @array_preguntas
    @num_pre_res =  @array_preguntas.count-1  
    @pregunta_info = @array_preguntas[num_pre]



  end

  def respuestas(num_res)
    @array_respuestas = []
    for respuesta in 0..@array_pre_res.count-1
      modulo = respuesta % 3
      if modulo == 1
        @array_respuestas << @array_pre_res[respuesta].pregunta_res
      end
    end
    @array_respuestas
    @respuesta_info = @array_respuestas[num_res]
  end


  def validar_respuesta(val_respuesta)

    p @respuesta_info
    if val_respuesta == @respuesta_info
      @salida_respuesta = 'Correcto!!!!!'
      @correctas += 1
    else
      @salida_respuesta = 'Incorrecto!'
      @incorrectas += 1
    end
  end




end


class PreguntaRespuesta

  attr_accessor :pregunta_res

  def initialize(pregunta_res)

    @pregunta_res = pregunta_res

  end

end


# maraton = MaratonModulo.new

# maraton.preguntas
# maraton.pregunta_info
# maraton.preguntas
# maraton.pregunta_info
# puts ""
# maraton.respuestas





