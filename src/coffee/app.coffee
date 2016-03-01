###*
 * START APP.JS
###

APP = {}

APP.toggleActivation = (el, elClass) ->
	elClass = elClass || 'is-active'
	$(el).toggleClass(elClass)

$ ->
	APP.toggleActivation('body')