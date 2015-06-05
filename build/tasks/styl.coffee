gulp = require('gulp')
$ = require('gulp-load-plugins')(lazy: true)
browserSync = require('browser-sync')
onError = require('../error')

# Stylus Plugins
nib = require('nib')
del = require('del')
axis = require('axis')
rupture = require('rupture')
jeet = require('jeet')
autoprefixer = require('autoprefixer-stylus')

gulp.task 'styl', ->
	# compress: true
	# .pipe(autoprefixer())
	return gulp.src('src/styl/index.styl')
		.pipe $.plumber(errorHandler: onError)
		.pipe $.accord('stylus', {
			use: [
				axis()
				jeet()
				rupture()
				nib()
				autoprefixer()
			]
			include: ['src/styl']
			# url: true
			compress: false
			url:
    			name: 'embedurl'
		})
		.pipe $.rename('main.css')
		# .pipe $.csscomb()
		# .pipe gulp.dest('./tmp/css')
		.pipe $.bless()
		.pipe gulp.dest('app/css')
		.pipe browserSync.reload({stream:true})

# gulp.task 'css', ->
# 	return gulp.src('./tmp/css/**/*.css')
# 		.pipe $.plumber(errorHandler: onError)
# 		.pipe $.concat('main.css')
# 		.pipe $.csscomb()
# 		.pipe $.bless()
# 		.pipe gulp.dest('app')
# 		.pipe browserSync.reload({stream:true})


gulp.task 'styleguide', ->
	StyleGuide = require('styleguidejs')
	sg = new StyleGuide
	sg.addFile 'app/css/main.css'
	sg.render
		extraCss: [ 
			'app/css/font.css'
		]
		extraJs: [ 
			'build/styleguide/holder.min.js' 
			'app/js/vendor.js', 
			'app/js/app.js', 
		]
		templateJs: 'build/styleguide/styleguide.js'
		template: 'build/styleguide/index.jade'
		outputFile: 'docs/styleguide/index.html'
