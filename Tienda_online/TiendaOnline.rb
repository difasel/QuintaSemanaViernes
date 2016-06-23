require 'colorize'
require 'csv'


class Tienda
	attr_accessor :arreglo_list

	def initialize
		@count_user = 0
		@arreglo_list = []
		@arreglo_users = []
		@file_name = "inventario.csv"
		@file_name_user = "users.csv"
		system "clear"
		puts "Welcome to the online ".white + "store".yellow + ": Moda (www.5shion.com) ".white
		puts "-".white * 90
		read_csv_catalogo
		read_csv_users
		
	end

	  def read_csv_catalogo
    	CSV.foreach(@file_name) do |row|
      	@arreglo_list <<  Producto.new(row[0], (row[1]))  
    	end
    @arreglo_list
  	end

  	def read_csv_users
    	CSV.foreach(@file_name_user) do |row|
      	@arreglo_users <<  Usuario.new(row[0], (row[1]))  
    	end
    @arreglo_users
  	end

	def menu_1
		puts "Select option " + "number:".yellow
		puts "1.".yellow + "Login"
		puts "2.".yellow + "Register"
		puts "3.".yellow + "Exit"
		puts ""
		print "Option:"
		option_menu = gets.to_i


		case  option_menu

		when 1
			login
		when 2
			register
		when 3
			exit
		else
			puts "error!"
			menu_1
		end

	end

	def menu_2
		puts "Select option " + "number:".yellow
		puts "1.".yellow + "Logout"
		puts "2.".yellow + "Catalog"
		puts "3.".yellow + "New product"
		puts "4.".yellow + "Users"
		puts ""
		print "Option:"
		option_menu = gets.to_i


		case  option_menu

		when 1
			menu_1
		when 2
			catalogo
			puts "--" * 50
			sleep(3)
			system "clear"
			menu_2
		when 3
			puts "Introduce tu nueva informacion de producto: "
			puts "Producto:".yellow
			@producto = gets.chomp
			puts ""
			puts "Descripcion: "
			@descripcion = gets.chomp
			add_catalogo(@producto, @descripcion)
			menu_2
		when 4
			usuarios_registrados
			menu_2
		else
			puts "error!"
			menu_2
		end

	end


	def menu_3
		puts "Select option " + "number:".yellow
		puts "1.".yellow + "Logout"
		puts "2.".yellow + "Catalog"
		puts ""
		print "Option:"
		option_menu = gets.to_i


		case  option_menu

		when 1
			menu_1
		when 2
			catalogo
			puts "--" * 50
			menu_3
		else
			puts "error!"
			menu_3
		end

	end


	def producto
	end


	def usuarios
	end

	def login
		puts "Email:".yellow
		@user_email = gets.chomp
		puts ""
		puts "Password:".yellow
		@user_password = gets.chomp


	if pass == @user_password && email == @user_email
		system "clear"
		puts "Bienvenido super user".red
		puts ""
		menu_2
	elsif pass != @user_password && email != @user_email
		system "clear"


		for valida_user in 0..@arreglo_users.count-1
			if @arreglo_users[valida_user].email_user == @user_email && @arreglo_users[valida_user].pass_user == @user_password
				@count_user += 1
			end
		end

		if @count_user >= 1
			puts "Bienvenido mortal".blue
		  puts ""
		  menu_3
		else 
			puts "Tu usuario no existe, necesitas registrate"
		end 
			# @count_user = 0

	end


	end

	def register
		puts "Introduce tu nueva informacion de usuario: "
		puts "Email:".yellow
		@user_email = gets.chomp
		puts ""
		puts "Password: "
		@user_password = gets.chomp

		add_user(@user_email, @user_password)
		menu_1

	end

	def add_user(new_email, new_pass)
    File.open(@file_name_user, 'a+') do |new_line|
      new_line.write("\n"+new_email +"," + new_pass)
    end
    @arreglo_users << Usuario.new(new_email, new_pass)
  end

  def add_catalogo(producto, descripcion)
    File.open(@file_name, 'a+') do |new_line|
      new_line.write("\n"+producto +"," + descripcion)
    end
    @arreglo_list << Producto.new(producto, descripcion)
  end

	def catalogo
		system "clear"
		puts "*" * 70
		puts "El catalogo es: "
		puts "*" * 70
		puts "Producto   ---   Descripcion"
		puts "-" * 70
		for num_cat in 0..@arreglo_list.count-1
		  puts "#{@arreglo_list[num_cat].product}  ---  #{@arreglo_list[num_cat].description}"
		end
		puts "*" * 70

	end

	def usuarios_registrados
		system "clear"
		puts "*" * 70
		puts "Los Ususarios son: "
		puts "*" * 70
		puts "Usuario   ---   Password"
		puts "-" * 70
		for num_cat in 0..@arreglo_users.count-1
		  puts "#{@arreglo_users[num_cat].email_user}  --- #{@arreglo_users[num_cat].pass_user}"
		end
		puts "*" * 70
		sleep (3)
		system "clear"
		

	end

	def exit
		system "clear"
		puts "Hasta la vist bro"
		sleep(2)
		system "clear"
		exit!
	end

	private

	def email
		@email = "ivan"
	end

	def pass
		@pass = "ivan"
	end
end


class Usuario

	attr_accessor :email_user, :pass_user

	def initialize(email_user, pass_user)
		@email_user = email_user
		@pass_user = pass_user
	end
end

class Producto

	attr_accessor :product, :description

	def initialize(product, description)
		@product = product
		@description = description
	end
end


tienda = Tienda.new


tienda.menu_1



