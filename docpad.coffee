# DocPad Configuration File

# http://docpad.org/docs/config



# Define the DocPad Configuration

docpadConfig = {
	prompts: false

	collections:
		pages: ->
			@getCollection("html").findAllLive({isPage:true},[{filename:1}]).on "add", (model) ->
				model.setMetaDefaults({layout:"default"})

	templateData:

		site:

			title: "Sample Website"

		getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
}



# Export the DocPad Configuration
module.exports = docpadConfig