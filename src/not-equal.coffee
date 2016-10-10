ReturnValue = require 'nanocyte-component-return-value'
sameType    = require 'same-type'
_           = require 'lodash'

class NotEqual extends ReturnValue
  onEnvelope: (envelope) =>
    {config,message} = envelope
    {left,right} = config

    [typedLeft, typedRight] = sameType [left, right]
    return message if ! _.isEqual(typedLeft, typedRight)

module.exports = NotEqual
