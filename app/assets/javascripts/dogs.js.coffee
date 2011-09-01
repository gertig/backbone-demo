$(() ->
	
	class window.Dog extends Backbone.Model
		url: () ->
			if @id? then '/dogs/'+ @id else '/dogs'
	
		defaults: 
			dog:
				name: "No Name"
				age: 0
		initialize: () ->
			#nothing here
	
	class window.DogCollection extends Backbone.Collection
		model: Dog
		url: '/dogs'
	
	window.Dogs = new DogCollection
	
	window.DogView = Backbone.View.extend
		tagName: 'tr'
	
		events: () ->
			#events go here
			
		initialize: () ->
			#init goes here
	
		render: () ->
			dog = this.model.toJSON()
			$(@el).html(ich.dog_template(dog))
			@
	
	class window.AppView extends Backbone.View
		el: $('#dogs_app')
		
		events:
			"submit form#new_dog": "createDog"
	
		initialize: () ->
			Dogs.bind 'add', @addOne
			Dogs.bind 'reset', @addAll
			Dogs.bind 'all', @render
			
			Dogs.fetch()
			
		addOne: (dog) =>
			view = new DogView 
				model:dog
			@$('#dog_table').append(view.render().el)
		
		addAll: =>
			Dogs.each(@addOne)
			
		newAttributes: (e) ->
			new_dog_form = $(e.currentTarget).serializeObject()
			dog:
				name: new_dog_form['dog[name]']
				age: new_dog_form['dog[age]']
				
		createDog: (e) ->
			e.preventDefault()
			params = @newAttributes(e)
			Dogs.create(params)
			
	window.App = new AppView
	return
)