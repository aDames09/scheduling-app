var gulp = require('gulp'),
  jshint = require('gulp-jshint'),
  uglify = require('gulp-uglify'),
  jsImport = require('gulp-js-import'),
  sass = require('gulp-sass'),
  postcss = require('gulp-postcss'),
  autoprefixer = require('autoprefixer'),
  cssmqpacker = require('css-mqpacker'),
  cssnano = require('cssnano'),
  rename = require('gulp-rename'),
  webpack = require('webpack'),
  webpackStream = require('webpack-stream'),
  livereload = require('gulp-livereload');

/* CSS Build Steps */

gulp.task('build-css', function() {
  var plugins = [
    autoprefixer({ browsers: 'last 4 versions' }),
    //cssmqpacker({sort: true}),
    cssnano()
  ];

  return gulp
    .src('css/scss/*.scss')
    .pipe(sass({ outputStyle: 'expanded' }))
    .on('error', sass.logError)
    .pipe(postcss(plugins))
    .pipe(gulp.dest('css'))
    .pipe(livereload());
});

/* JS Build Steps */

gulp.task('build-js', function() {
  return gulp
    .src('js/jsSrc/*.js')
    .pipe(jshint())
    .pipe(jshint.reporter('jshint-stylish'))
    .pipe(jsImport())
    .pipe(uglify())
    .pipe(
      rename(function(path) {
        path.basename += '.min';
      })
    )
    .pipe(gulp.dest('js'))
    .pipe(livereload());
});

/* Preact Build */

gulp.task('build-preact', function(callback) {
  return gulp
    .src('js/jsSrcPreactEx/index.js')
    .pipe(webpackStream(require('./webpack.config.js'), webpack))
    .pipe(gulp.dest('js'))
    .pipe(livereload());
});

/* Watching */

gulp.task('watch', function() {
  gulp.watch('js/jsSrc/*.js', gulp.series('build-js'));
  gulp.watch('js/jsSrc/**/*.js', gulp.series('build-js'));

  gulp.watch('js/jsSrcPreactEx/*.js', gulp.series('build-preact'));
  gulp.watch('js/jsSrcPreactEx/**/*.jsx', gulp.series('build-preact'));

  gulp.watch('css/scss/*.scss', gulp.series('build-css'));
  gulp.watch('css/scss/**/*.scss', gulp.series('build-css'));
});

/* Default Task */

gulp.task('default', gulp.series('watch'), function(callback) {
  return gulp.src('*').pipe(livereload({ start: true }));
});
