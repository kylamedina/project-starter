# REQUIREMENTS
gulp = require('gulp')
$ = require('gulp-load-plugins')(lazy: true)
browserSync = require('browser-sync')
onError = require('./error')
runSequence = require('run-sequence').use(gulp)
	
requireDir = require('require-dir')

# Require all tasks in gulp/tasks, including subfolders
requireDir './tasks',
  recurse: true

gulp.task 'watch', ['browser-sync'], ->
	gulp.watch [ 'src/static/**/*' ], ['static']
	gulp.watch [ 'src/img/**/*' ], ['img']
	gulp.watch [ 'src/svg/**/*.svg' ], ['svg','jade']
	gulp.watch [ 'src/styl/**/*.styl' ], ['styl','styleguide']
	gulp.watch [ 'src/jade/**/*.jade' ], ['jade']
	gulp.watch [ 'src/font/**/*' ], ['font']
	gulp.watch [ 'src/coffee/**/**/*.coffee' ], ['coffee']
	gulp.watch [ './build/styleguide/**/*', './README.md' ], ['styleguide']
	gulp.watch [ './tmp/js/**/*.js' ], ['js']

gulp.task 'default', (cb) ->
	runSequence 'install',
		'coffee',
		'styl',
		'bower',
		'jade',
		'font',
		'static', 
		'img', 
		'svg',
		'js',
		'watch',
		'styleguide'
		->


gulp.task 'browser-sync', ->
	app = browserSync.create('app')
	docs = browserSync.create('docs')
	app.init
		port: 8088
		open: false
		tunnel: false
		online: true
		ghostMode: false
		logConnections: true
		notify: false
		files: {
			'app/**/*'
		}
		server: {
			baseDir: [
				'app'
			]
		}
	docs.init
		port: 1111
		open: false
		tunnel: false
		online: true
		ghostMode: false
		logConnections: false
		notify: false
		injectChanges: false
		codeSync: false
		ui: false
		snippetOptions:
		    rule:
		        match: /<body>/i,
		        fn: (snippet, match) ->
		            return snippet + match;
		files: {
			'docs/styleguide/**/*'
		}
		server: {
			baseDir: [
				'docs/styleguide'
			]
		}


gulp.task 'bs-reload', ->
	browserSync.reload

gulp.task 'clear', (done) ->
  $.cache.clearAll done
