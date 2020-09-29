var autoprefixer, spawn, del, gulp, series, parallel, src, dest, cleanCSS, concat, exec, gulpLivescript, livereload, postcss, pug, sass, gutil, options, postcssImport, postcssScss, tailwindcss, clean, gulpfile, views, css, livescript, watch;
autoprefixer = require('autoprefixer');
spawn = require('child_process').spawn;
del = require('del');
gulp = require('gulp'), series = gulp.series, parallel = gulp.parallel, src = gulp.src, dest = gulp.dest;
cleanCSS = require('gulp-clean-css');
concat = require('gulp-concat');
exec = require('gulp-exec');
gulpLivescript = require('gulp-livescript');
livereload = require('gulp-livereload');
postcss = require('gulp-postcss');
pug = require('gulp-pug');
sass = require('gulp-sass');
gutil = require('gulp-util');
options = require('./package.json').options;
postcssImport = require('postcss-import');
postcssScss = require('postcss-scss');
tailwindcss = require('tailwindcss');
clean = function(cb){
  del(['!gulpfile.ls', '*.js', '*.html']);
  cb();
};
gulpfile = function(cb){
  src('./gulpfile.ls').pipe(gulpLivescript({
    bare: true
  })).on('error', gutil.log).pipe(dest('.'));
  cb();
};
views = function(cb){
  src('*.pug').pipe(pug({
    doctype: 'html',
    pretty: false
  })).pipe(dest(options.paths.view)).pipe(livereload());
  cb();
};
css = function(cb){
  src(['./css/*.scss']).pipe(postcss([
    postcssImport, tailwindcss(options.config.tailwindjs), autoprefixer({
      flexbox: 'no-2009'
    })
  ], {
    syntax: postcssScss
  })).pipe(sass({
    outputStyle: 'nested'
  }).on('error', sass.logError)).pipe(concat('style.css')).pipe(cleanCSS({
    compatibility: '*',
    debug: false,
    inline: ['all'],
    level: {
      1: {
        specialComments: 0
      }
    }
  })).pipe(dest(options.paths.css)).pipe(exec('../nix/scripts/frontend_build.sh', {
    continueOnError: false,
    pipeStdout: false
  })).pipe(exec.reporter({
    err: true,
    stderr: true,
    stdout: true
  })).pipe(livereload());
  cb();
};
livescript = function(cb){
  src('./*.ls').pipe(gulpLivescript({
    bare: true
  })).on('error', gutil.log).pipe(dest('.'));
  cb();
};
watch = function(){
  livereload.listen();
  gulp.watch(['gulpfile.ls'], gulpfile);
  gulp.watch(['*.ls', '!gulpfile.ls'], livescript);
  gulp.watch(['*.pug'], views);
  gulp.watch(['./css/*.scss', 'tailwind.config.ls'], css);
};
exports.clean = clean;
exports.gulpfile = gulpfile;
exports.views = views;
exports.livescript = livescript;
exports.css = css;
exports.watch = watch;
exports['default'] = series(views, livescript, css);