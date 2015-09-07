## task-registry-template-engine-lodash [![npm](https://img.shields.io/npm/v/task-registry-template-engine-lodash.svg)](https://npmjs.org/package/task-registry-template-engine-lodash)

[![Build Status](https://img.shields.io/travis/snowyu/task-registry-template-engine-lodash.js/master.svg)](http://travis-ci.org/snowyu/task-registry-template-engine-lodash.js)
[![Code Climate](https://codeclimate.com/github/snowyu/task-registry-template-engine-lodash.js/badges/gpa.svg)](https://codeclimate.com/github/snowyu/task-registry-template-engine-lodash.js)
[![Test Coverage](https://codeclimate.com/github/snowyu/task-registry-template-engine-lodash.js/badges/coverage.svg)](https://codeclimate.com/github/snowyu/task-registry-template-engine-lodash.js/coverage)
[![downloads](https://img.shields.io/npm/dm/task-registry-template-engine-lodash.svg)](https://npmjs.org/package/task-registry-template-engine-lodash)
[![license](https://img.shields.io/npm/l/task-registry-template-engine-lodash.svg)](https://npmjs.org/package/task-registry-template-engine-lodash)

The lodash template engine.

## Usage

```js

var TemplateEngine  = require('task-registry-template-engine')
//register the lodash template engine
require('task-registry-template-engine-lodash')

var result = templateEngine.executeSync({
  template: 'hello ${user}!'
  , data: {user: 'Mikey'}
  , engine: 'Lodash' //optional, defaults to the first registered template engine.
}) // the result is 'hello Mikey!'

var lodashEngine = TemplateEngine 'Lodash'
result = lodashEngine.executeSync({
  template: 'hello ${user}!'
  , data: {user: 'Mikey'}
  , write: true //write the compiled template string to engine for later used.
})  // the result is 'hello Mikey!'

result = lodashEngine.executeSync({data: {user: 'Jacky'})
// the result is 'hello Jacky!'
```

## API

templateEngine.executeSync(aOptions)/templateEngine.execute(aOptions, done)

* arguments
  * `aOptions` *(Object)*:
    * `template` *(String)*: the template string
    * `write` *(Boolean)*: write the template function(compiled from the template string) to the template engine.
      default to false.
    * `data` *(Object)*: the data properties to replace.
    * `escape` *(RegExp)*: # The HTML "escape" delimiter.
    * `evaluate` *(RegExp)*: # The "evaluate" delimiter.
    * `imports` *(Object)*: # An object to import into the template as free variables.
    * `interpolate` *(RegExp)*: # The "interpolate" delimiter.
    * `sourceURL` *(String)*: # The sourceURL of the template’s compiled source.
    * `variable` *(String)*: # The data object variable name.
  * `done` *Function(error, result)*: the result callback function for async execute.
* returns *(String)*: the rendered result string.

## TODO


## License

MIT
