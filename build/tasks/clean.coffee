gulp = require('gulp')
del = require('del')

gulp.task 'clean:svg', ->
	return del [
		'app/svg/**/*'
		'docs/styleguide/svg/**/*'
	],
		force: true
	, (err) ->

gulp.task 'clean:docs', ->
	return del [
		'docs'
	],
		force: true
	, (err) ->

gulp.task 'clean', ->
	return del [
		'./tmp/**/*'
		'docs/**/*'
		'app/**/*'
		# 'src/components/**/*'
		'**/!.gitignore'
		'**/!.gitkeep'
	],
		force: true
	, (err) ->