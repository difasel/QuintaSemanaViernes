require_relative 'MaratonModulo'
require_relative 'MaratonVista'


class ControladorMaraton


  def initialize

    @maraton_m = MaratonModulo.new
    @maraton_v = MaratonVista.new

  end

  def inicio_juego

  	@maraton_v.inicio_juego

  end

  def preguntas(num)
  	@maraton_m.preguntas(num)
  	@maraton_v.preguntas(@maraton_m.pregunta_info)

  end


  def respuestas(num)
  	@maraton_m.respuestas(num)

  end

  def validar_respuesta
  	@maraton_m.validar_respuesta(@maraton_v.val_respuesta)
  	@maraton_v.validar_respuesta(@maraton_m.salida_respuesta)
  end

  def fin_juego
  	@maraton_v.fin_juego(@maraton_m.correctas, @maraton_m.incorrectas)
  end



end

maraton_modulo = MaratonModulo.new
maraton = ControladorMaraton.new

system "clear"
maraton.inicio_juego

for num_preguntas in 0..maraton_modulo.num_pre_res-1
	maraton.preguntas(num_preguntas)
	maraton.respuestas(num_preguntas)
	maraton.validar_respuesta
end

maraton.fin_juego