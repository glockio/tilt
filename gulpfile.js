require('coffee-script/register');

var gulp = require('gulp'),
  nodemon = require('gulp-nodemon'),
  config = require('./config/config'),
  livereload = require('gulp-livereload'),
  sass = require('gulp-ruby-sass');



gulp.task('sass', function () {
  return gulp.src('./public/css/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('./public/css'))
    .pipe(livereload());
});

gulp.task('watch', function() {
  gulp.watch('./public/css/*.scss', ['sass']);
});

gulp.task('develop', function () {
  livereload.listen();
  nodemon({
    script: 'app.js',
    ext: 'js coffee handlebars',
  }).on('restart', function () {
    setTimeout(function () {
      livereload.changed(config.root);
    }, 500);
  });
});

gulp.task('default', [
  'sass',
  'develop',
  'watch'
]);
