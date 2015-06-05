###*
 * START APP.JS
###

MKBL = {}

MKBL.toggleActivation = (el, elClass) ->
	elClass = elClass || 'is-active'
	$(el).toggleClass(elClass)

$ ->
	MKBL.toggleActivation('body')