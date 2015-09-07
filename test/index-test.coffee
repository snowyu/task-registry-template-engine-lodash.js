chai            = require 'chai'
sinon           = require 'sinon'
sinonChai       = require 'sinon-chai'
should          = chai.should()
expect          = chai.expect
assert          = chai.assert
chai.use(sinonChai)

setImmediate    = setImmediate || process.nextTick

LodashTemplateEngine  = require '../src'
TemplateEngine        = require 'task-registry-template-engine'

describe 'Lodash Template Engine', ->
  templateEngine = TemplateEngine 'Lodash'

  it 'should get the lodash template engine', ->
    expect(templateEngine).to.instanceof LodashTemplateEngine

  describe 'executeSync', ->
    it 'should render a template', ->
      result = templateEngine.executeSync
        template:'hi ${user}!'
        data:
          user: 'Mikey'
      expect(result).to.be.equal 'hi Mikey!'

    it 'should render a template via new interpolate', ->
      result = templateEngine.executeSync
        template:'hi {{user}} {{user}}!'
        data:
          user: 'Mikey'
        interpolate: /{{([\s\S]+?)}}/g

      expect(result).to.be.equal 'hi Mikey Mikey!'

    it 'should render a template via difference data', ->
      result = templateEngine.executeSync
        template:'hi ${user}!'
        data:
          user: 'Mikey'
        write: true
      expect(result).to.be.equal 'hi Mikey!'
      result = templateEngine.executeSync data: user: 'Jacky'
      expect(result).to.be.equal 'hi Jacky!'

  describe 'execute', ->
    it 'should render a template', (done)->
      templateEngine.execute
        template:'hi ${user}!'
        data:
          user: 'Mikey'
      , (err, result)->
        unless err
          expect(result).to.be.equal 'hi Mikey!'
        done(err)

    it 'should render a template via new interpolate', (done)->
      templateEngine.execute
        template:'hi {{user}} {{user}}!'
        data:
          user: 'Mikey'
        interpolate: /{{([\s\S]+?)}}/g
      , (err, result)->
        unless err
          expect(result).to.be.equal 'hi Mikey Mikey!'
        done(err)

    it 'should render a template via difference data', (done)->
      templateEngine.execute
        template:'hi ${user}!'
        data:
          user: 'Mikey'
        write: true
      , (err, result)->
        unless err
          expect(result).to.be.equal 'hi Mikey!'
          result = templateEngine.executeSync data: user: 'Jacky'
          expect(result).to.be.equal 'hi Jacky!'
        done(err)
