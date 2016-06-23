require 'colorize'

class MaratonVista

	attr_accessor :val_respuesta

	def inicio_juego
		puts "Cargando cartas del juego: "
		for i in 1..10
		puts "♦".blue * i
		sleep(1.0/2.0)
		print "\e[2H"
	end

		puts "Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta."
		puts "Listo?  Arranca el juego!"
		puts ""
	end

	def preguntas(pregunta)
		puts "-" * 90
		puts "Pregunta"
		puts pregunta.yellow
		print  "Intento:  " 
		@val_respuesta = gets.chomp
	end

	def validar_respuesta(salida_respuesta)
		puts salida_respuesta.magenta
		puts ""
	end

	def fin_juego(correctas, incorrectas)
		puts "Acabaste: "
		puts "Tuviste " + "\"#{correctas}\"".blue + " Correctas y " + "\"#{incorrectas}\"".red + " Incorrectas."
		sleep(3)
		system "clear"
	end


end