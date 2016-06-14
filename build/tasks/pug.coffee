gulp = require('gulp')
$ = require('gulp-load-plugins')(lazy: true)
browserSync = require('browser-sync')

onError = (error) ->
	$.notify.onError('ERROR: <%- error.plugin %>') error
	$.util.beep()
	$.util.log '======= ERROR. ========\n'
	$.util.log error

gulp.task 'pug-watch', ->
	return gulp.src(['src/pug/**/*.pug','!src/pug/layouts/**/*.pug','!src/pug/includes/**/*.pug','!src/pug/modules/**/*.pug'])
		.pipe $.plumber(errorHandler: onError)
		.pipe $.pug()
		# .pipe $.accord 'pug',
		# 	pretty: true
		.pipe gulp.dest('app')

gulp.task('pug', ['pug-watch'], browserSync.reload);