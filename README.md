# Unbounce A-Team Programming Challenge

## Gems Used
- [Exif](https://github.com/tonytonyjan/exif)
- [Virtus](https://github.com/solnic/virtus)
- [RSpec](https://github.com/rspec/rspec)

## Usage
Clone the repository and run `bundle install` to install all gem dependencies.
Run `ruby app.rb` and it should generate an html of exif data

Open the generated html `open ./index.html`

To have an html output, use the `--format` option which is used as: `ruby app.rb --format=html`. This defaults to `csv`

To specify a directory, use the `--directory` option which is a relative path from where the project is. This can be used as `ruby app.rb --directory="../my_custom_directory"`

## Run Da Specs
run the specs with `rspec`
