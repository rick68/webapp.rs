require! {
  \./package.json : {options}
}

module.exports = do
  furute: {}
  purge: {
    +enabled
    -preserve-html-elements
    layers: <[base components utilities]>
    content:
      * options.paths.view + "/index.html"
      * options.paths.js + "/main.js"

    /* These options are passed through directly to PurgeCSS */
    options:
      whitelist:
        <[]>
  }
  theme:
    extend: {}
  variants: {}
  pulgins: []
