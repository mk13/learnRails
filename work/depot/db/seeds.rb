# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(title: 'Programming Ruby 1.9',
	description: 
		%{<p>
			Ruby is the fastest growing and most exciting dynamic language
			out there. If you need to get working programs delivered fast,
			you should add Ruby to your toolbox.
		</p>},
	image_url: 'ruby.png',
	price: 49.95
)

Product.create(title: 'Lemon',
	description:
		%{<p>
			This is a lemon.
			Why would you buy this?
		</p>},
	image_url: 'lemon.jpg',
	price: 2.00
)

Product.create(title: 'Learning Python, 5th edition',
	description: 
		%{<p>
			Get a comprehensive, in-depth introduction to the core Python
			language with this hands-on book. Based on author Mark Lutz's
			popular training course, this updated fifth edition will help
			you quickly write efficient, high-quality code with Python.
			It is an ideal way to begin, whether you're new to programming
			or a professional developer versed in other languages.
		</p>},
	image_url: 'learningPython.jpg',
	price: 40.52
)

Product.create(title: 'The Goldfinch: A Novel',
	description: 
		%{<p>
			Pulitzer Prize for fiction book, written by Donna Tart.
		</p>},
	image_url: 'goldfinch.jpg',
	price: 17.95
)

Product.create(title: 'X-Men: Days of Future Past[Blu-ray]',
	description: 
		%{<p>
			Blu-ray DVD of X-Men: Days of Future Past.
		</p>},
	image_url: 'xmen.jpg',
	price: 19.99
)