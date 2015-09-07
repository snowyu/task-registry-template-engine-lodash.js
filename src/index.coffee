_                 = require 'lodash'
isFunction        = require 'util-ex/lib/is/type/function'
isString          = require 'util-ex/lib/is/type/string'
Task              = require 'task-registry-template-engine'
register          = Task.register
aliases           = Task.aliases
defineProperties  = Task.defineProperties

module.exports = class LodashTemplateEngine
  register LodashTemplateEngine

  defineProperties LodashTemplateEngine,
    escape: # The HTML "escape" delimiter.
      type: 'RegExp'
    evaluate: # The "evaluate" delimiter.
      type: 'RegExp'
    imports: # An object to import into the template as free variables.
      type: 'Object'
    interpolate: # The "interpolate" delimiter.
      type: 'RegExp'
    sourceURL: # The sourceURL of the template’s compiled source.
      type: 'String'
    variable: # The data object variable name.
      type: 'String'
    template: # The tempalte function or string.
      type: ['Function', 'String']

  constructor: ->return super

  _executeSync: (aOptions)->
    vTemplate = aOptions.template
    vTemplate = _.template vTemplate, aOptions if isString vTemplate
    if isFunction vTemplate
      @template = vTemplate if aOptions.write
      result = vTemplate aOptions.data
    result
