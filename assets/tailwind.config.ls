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
        <[bg-red-500 px-4]> ++

        /* uikit */
        <[uk-card uk-card-default uk-card-body uk-width-1-3@s
          uk-position-center uk-vard-title uk-fieldset uk-input
          uk-margin-bottom uk-button uk-button-primary]>
  }
  theme:
    extend: {}
  variants: {}
  pulgins: []
