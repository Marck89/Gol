#!/usr/bin/ruby
require 'world.rb'
puts "Start Conway's Game of Life"
require 'set'

class GameoflifeController < ApplicationController
	def index
				begin
					render :action => 'index'
				rescue Exception => e
				  puts e.message
				  puts e.backtrace.inspect
				end	
	end

	def init
				begin
					file_data = params[:source]
					@fileok = true
					if File.exist? file_data
						fname = file_data
						sizes = File.read(fname).split
						size = sizes.size()
						@result = []
						
						begin
						x = sizes[0].to_i
						y = sizes[1].to_i
						
						rescue
							@fileok = false
							puts "Formato input non valido"
							render :action => 'index'
						end
						if( x == 0 || y == 0)
							@fileok = false
							puts "Generazione matrice non riuscita"
							render :action => 'index'
						end			
		
						@result = World.new(Array.new(x){Array.new(y) { rand(0..1) }})
					else
						puts "File non esiste"
						render :action => 'index'
					end
				rescue Exception => e
					
				  puts e.message
				  puts e.backtrace.inspect
				end	
	end
end
