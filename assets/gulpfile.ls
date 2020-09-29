require! {
  \autoprefixer
  \child_process : {spawn}
  \del
  gulp: {series, parallel, src, dest}: gulp
  \gulp-clean-css : clean-CSS
  \gulp-concat : concat
  \gulp-exec : exec
  \gulp-livescript
  \gulp-livereload : livereload
  \gulp-postcss : postcss
  \gulp-pug : pug
  \gulp-sass : sass
  \gulp-util : gutil
  \./package.json : {options}
  \postcss-import
  \postcss-scss
  tailwindcss
}

clean = (cb) !->
  del <[!gulpfile.ls *.js *.html]>
  cb!

gulpfile = (cb) !->
  src \./gulpfile.ls
    .pipe gulp-livescript {+bare} \
      .on \error gutil.log
    .pipe dest \.
  cb!

views = (cb) !->
  src \*.pug
    .pipe pug do
      doctype: \html
      pretty: false
    .pipe dest options.paths.view
    .pipe livereload!
  cb!

css = (cb) !->
  src <[./css/*.scss]>
    .pipe postcss [
      * postcssImport
      * tailwindcss options.config.tailwindjs
      * autoprefixer do
          flexbox: \no-2009
      ], do
        syntax: postcssScss
    .pipe (sass output-style: \nested
      .on \error, sass.log-error)
    .pipe concat \style.css
    .pipe clean-CSS {
      compatibility: '*'
      -debug
      inline: <[all]>
      level: 1: special-comments: 0
    }
    .pipe dest options.paths.css
    .pipe exec '../nix/scripts/frontend_build.sh', {
      -continue-on-error
      -pipe-stdout
    }
    .pipe exec.reporter {
      +err
      +stderr
      +stdout
    }
    .pipe livereload!
  cb!

livescript = (cb) !->
  src \./*.ls
    .pipe gulp-livescript {+bare} \
      .on \error gutil.log
    .pipe dest \.
  cb!

watch = !->
  livereload.listen!

  gulp.watch <[gulpfile.ls]>, gulpfile
  gulp.watch <[*.ls !gulpfile.ls]>, livescript

  gulp.watch <[*.pug]>, views
  gulp.watch <[./css/*.scss tailwind.config.ls]>, css

exports <<< { clean, gulpfile, views, livescript, css, watch }

exports.default = series views, livescript, css
