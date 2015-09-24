ReturnValue = require 'nanocyte-component-return-value'
NotEqual = require '../src/not-equal'

describe 'NotEqual', ->
  beforeEach ->
    @sut = new NotEqual

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'
