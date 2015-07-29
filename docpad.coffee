# DocPad Configuration File

# http://docpad.org/docs/config



# Define the DocPad Configuration

docpadConfig = {
	prompts: false

	plugins:
		contentful:
			collectionDefaults:
				accessToken: "23e9e3d2eb2a2303d64262692db0cde069f45f6d28f0edd5c931e0dadc343828"
				spaceId: "sd0naewg9xeu"
			
			collections: [
				{
					filters:
						content_type: "1vrrmD9SDaSaGMOmOm68SE"
					relativeDirPath: "facilities"
					collectionName: "facilities"
					extension: ".html.eco"
					injectDocumentHelper: (document) ->
						document.setMeta(
							meta:
								layout: "default"
								tags: (document.get('tags') or []).concat(['facility'])
								data: """
									<%- @partial('facility') %>
									"""
						)
				},
				{
					filters:
						content_type: "1jRjvaLib2SuWMQOeQ2ASw"
					relativeDirPath: "categoryPages"
					collectionName: "categoryPages"
					extension: ".html.eco"
					injectDocumentHelper: (document) ->
						document.setMeta(
							meta:
								layout: "default"
								tags: (document.get('tags') or []).concat(['categoryPage'])
								data: """
									<%- @partial('categoryPage') %>
									"""
						)
				},
				{
					filters:
						content_type: "6c0JfTwWasOeoC8mgyoOSw"
					relativeDirPath: "shops"
					collectionName: "shops"
					extension: ".html.eco"
					injectDocumentHelper: (document) ->
						document.setMeta(
							meta:
								layout: "default"
								tags: (document.get('tags') or []).concat(['shop'])
								data: """
									<%- @partial('shop') %>
									"""
						)
				},
				{
					filters:
						content_type: "wGMEYam1q0YIGuSK88si4"
					relativeDirPath: "videoPages"
					collectionName: "videoPages"
					extension: ".html.eco"
					injectDocumentHelper: (document) ->
						document.setMeta(
							meta:
								layout: "default"
								tags: (document.get('tags') or []).concat(['videoPage'])
								data: """
									<%- @partial('videoPage') %>
									"""
						)
				}	
			]

	collections:
		pages: ->
			@getCollection("html").findAllLive({isPage:true},[{filename:1}]).on "add", (model) ->
				model.setMetaDefaults({layout:"default"})

		contentPages: ->
			@getCollection("html").findAllLive({isContentPage:true},[{filename:1}]).on "add", (model) ->
				model.setMetaDefaults({layout:"default"})

	templateData:

		site:

			title: "Sample Website"

		getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
}



# Export the DocPad Configuration
module.exports = docpadConfig